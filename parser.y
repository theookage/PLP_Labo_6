-- Auteur Théo Coutaudier et Jérémie Santoro
{
module Parser  where 
import Lexer
import qualified Langdef
}

%name parser
%tokentype { Token }
%error { parseError }

%left '+' '-'
%left '*' '/'
%left '||' '&&' '=='
%right '++' '--'
%nonassoc in


%token
    name     {Name $$}
    int      {Int $$}
    bool     {Bool $$}
    let      {Let}
    in       {In}
    --if       {If}
    --then     {Then}
    -- else     {Else}
    '('      {LParen}
    ')'      {RParen}
    '{'      {LAcol}
    '}'      {RAcol} 
    '=='     {Equals}
    '='      {Eq}
    '&&'     {And}
    '||'     {Or}
    '+'      {Plus}
    '-'      {Minus}
    '++'     {Plusplus}
    '--'     {Minusminus}
    '*'      {Mult}
    '/'      {Divide}
    ','      {Comma}
    'const'  {Const}
    'int'    {TInt}
    'bool'   {TBool}


%%

Spec : Decl                         {Langdef.Decl $1}
     | Expr                         {Langdef.Expr $1}

Decl : 'const' name '=' Expr        {Langdef.VarConst $2 $4}
     | Type name '(' Arg ')'        {Langdef.Fct $1 $2 $4}

Expr    : name                       {Langdef.Ref $1}
        | let name '=' Expr in Expr  {Langdef.Let $2 $4 $6}
        | name '(' Arg ')'           {Langdef.AppFonction $1 $3}
        | '(' Arg ')'                {Langdef.Parenth $2}
        | Op                         {$1}
        | Lit                        {Langdef.Litteral $1}

Arg     :   Expr         {[$1]}
        |   Expr ',' Arg {$1:$3}

--IfThenElse : if '(' Cond ')' then smth {Langdef.If $3 $6}
--           | if '(' Cond ')' then smth else smthelse {Langdef.If $3 $6 $8}

Op   : Expr '+' Expr     {Langdef.OperatorBinary Langdef.Plus $1 $3}
     | Expr '-' Expr     {Langdef.OperatorBinary Langdef.Minus $1 $3}
     | Expr '*' Expr     {Langdef.OperatorBinary Langdef.Mult $1 $3}
     | Expr '/' Expr     {Langdef.OperatorBinary Langdef.Divide $1 $3}
     | Expr '||' Expr    {Langdef.OperatorBinary Langdef.Or $1 $3}
     | Expr '&&' Expr    {Langdef.OperatorBinary Langdef.And $1 $3}
     | Expr '==' Expr    {Langdef.OperatorBinary Langdef.Equals $1 $3}
     | Expr '++'         {Langdef.OperatorUnary Langdef.PlusPlus $1}
     | Expr '--'         {Langdef.OperatorUnary Langdef.MinusMinus $1}

Type : 'int' {Langdef.TypeInt}
     | 'bool' {Langdef.TypeBool}

Lit : Factor         {$1}
    | '{' Tuples '}' {Langdef.LTuples $2}

Tuples :    Expr ',' Expr {[$1]++[$3]}
       |    Expr ',' Tuples {$1:$3}

Factor : int  {Langdef.LInt $1}
       | '-' int {Langdef.LInt $2}
       | bool {Langdef.LBool $1}
{
    parseError :: [Token] -> a
    parseError _ = error "parsing error"
}