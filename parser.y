{
    module Parser (parser) where 
    import Langdef
    import Lexer
}

%name Parser
%tokentype { Token }
%error { parseError }

%token
    name     {lexer.name $$}
    int      {lexer.Int $$}
    bool     {lexer.Bool}
    let      {lexer.Let}
    in       {lexer.In}
    if       {lexer.If}
    then     {lexer.Then}
    else     {lexer.Else}
    '('      {lexer.LParen}
    ')'      {lexer.RParen}
    '=='     {lexer.Equals}
    '='      {lexer.Eq}
    '&&'     {lexer.And}
    '||'     {lexer.Or}
    '+'      {lexer.Plus}
    '-'      {lexer.Minus}
    '++'     {lexer.Plusplus}
    '--'     {lexer.Minusminus}
    '*'      {lexer.Mult}
    '/'      {lexer.Divide}
    ','      {lexer.Comma}
    true     {lexer.True}
    false    {lexer.False}
    const    {lexer.Const}
    type     {lexer.Type}


%%

Spec : Decl                         {DataLang.Decl $1}
     | Expr                         {DataLang.Expr $1}

Decl : const name '=' Expr          {DataLang.VarConst $2 $4}
     | type name '(' Tuples ')' {DataLang.Fct $1 $2 $4}
     | type name '('')'         {DataLang.Fct $1 $2 []}

Expr    : Factor                    {DataLang.Factor $1}
        | name                      {DataLang.Ref $1}
        | name '(' Arg ')'           {DataLang.AppFonction $1 $3}
        | name '(' ')'               {DataLang.AppFonction $1 []}
        | '(' Arg ')'           {$1}
        | Op                        {$1}

Arg     : Expr {[$1]}
        | Expr ',' Arg {$1:$3}


Exp : let name '=' Exp in Exp {DataLang.Let $2 $4 $6}
    | Expr                    {DataLang.Expr $1 }

--IfThenElse : if '(' Cond ')' then smth {DataLang.If $3 $6}
--           | if '(' Cond ')' then smth else smthelse {DataLang.If $3 $6 $8}

Op   : Op '+' Op     {DataLang.OperatorUnary DataLang.Plus $1 $3}
     | Op '-' Op     {DataLang.OperatorUnary DataLang.Minus $1 $3}
     | Op '*' Op     {DataLang.OperatorUnary DataLang.Mult $1 $3}
     | Op '||' Op    {DataLang.OperatorUnary DataLang.Or $1 $3}
     | Op '&&' Op    {DataLang.OperatorUnary DataLang.And $1 $3}
     | Op '==' Op    {DataLang.OperatorUnary DataLang.Equals $1 $3}
     | Op '/' Op     {DataLang.OperatorUnary DataLang.Divide $1 $3}
     | Factor '++'   {DataLang.OperatorBinary DataLang.Plusplus $1}
     | Factor '--'   {DataLang.OperatorBinary DataLang.Minusminus $1}
     | Factor        {Factor $1}

Lit : Factor {Factor $1}
    | '(' Tuples ')' {Tuples $1}

Tuples : Expr ',' Tuples {$1:$3}
       | Expr ',' Expr {[$1]++[$3]}

Factor : int {DataLang.TypeInt $1}
       | bool {DataLang.TypeBool $1}

    {
        parseError :: [Token] -> a
        parseError _ = error "parsing error"
    }









