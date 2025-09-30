
%%

%xstate YYINIT, DOUBLE_SLASH_COMMENT, ASTERISK_COMMENT, DOUBLE_ASTERISK_COMMENT
%xstate READING_STR

AllButSpaces = [^ \s\t\n\r]

%{
	public int asterisk_cnt = 0;
	public int double_asterisk_cnt = 0;
	public int slash_cnt = 0;
%}

%integer
%int

// Dos opciones super utiles: Yylex es un main, por leer archivo
// %debug
// %standalone

%%

<YYINITIAL> {
    '.'     { /* Ignorar char en Java: ", *, etc */}

    \"      { yybegin(READING_STR); }
    
    \/\/    { yybegin(DOUBLE_SLASH_COMMENT); }

    \/\*    { yybegin(ASTERISK_COMMENT); }

    \/\*\*  { yybegin(DOUBLE_ASTERISK_COMMENT); }

    [^]             { /* ignorar otros caracteres */ }
}

<READING_STR> {
    \\.    { /* Ignorar caracteres escapados */ }
    \"      { yybegin(YYINITIAL); }
    [^]     { /* ignorar otros caracteres */ }
}

<ASTERISK_COMMENT> {
    \*\/            {yybegin(YYINITIAL);}
    {AllButSpaces}  { asterisk_cnt++; }
    [^]            { /* ignorar otros caracteres */ }
}

<DOUBLE_ASTERISK_COMMENT> {
    \*\/            {yybegin(YYINITIAL); }
    {AllButSpaces}   { double_asterisk_cnt++; }
    [^]             { /* ignorar otros caracteres */ }
}

<DOUBLE_SLASH_COMMENT> {
    \n              { yybegin(YYINITIAL); }
    {AllButSpaces}  { slash_cnt++; }
    [^]             { /* ignorar otros caracteres */ } 
}
