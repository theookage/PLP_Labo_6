{
module Parser  where 
import Lexer
import qualified Langdef
}

%name parser
%tokentype { Token }
%error { parseError }

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
    type     {Type $$}
    'int'    {TInt}
    'bool'   {TBool}


%%

Spec : Decl                         {Langdef.Decl $1}
     | Expr                         {Langdef.Expr $1}

Decl : 'const' name '=' Expr        {Langdef.VarConst $2 $4}
     | type name '(' Arg ')'        {Langdef.Fct $1 $2 $4}

Expr    : name                       {Langdef.Ref $1}
        | let name '=' Expr in Expr  {Langdef.Let $2 $4 $6}
        | name '(' Arg ')'           {Langdef.AppFonction $1 $3}
        | '(' Arg ')'                {$2}
        | Op                         {$1}
        | Lit                        {$1}

Arg     : Expr         {[$1]}
        | Expr ',' Arg {$1:$3}

--IfThenElse : if '(' Cond ')' then smth {Langdef.If $3 $6}
--           | if '(' Cond ')' then smth else smthelse {Langdef.If $3 $6 $8}

Op   : Op '+' Op     {Langdef.OperatorBinary Langdef.Plus $1 $3}
     | Op '-' Op     {Langdef.OperatorBinary Langdef.Minus $1 $3}
     | Op '*' Op     {Langdef.OperatorBinary Langdef.Mult $1 $3}
     | Op '||' Op    {Langdef.OperatorBinary Langdef.Or $1 $3}
     | Op '==' Op    {Langdef.OperatorBinary Langdef.Equals $1 $3}
     | Op '/' Op     {Langdef.OperatorBinary Langdef.Divide $1 $3}
     | Factor '++'   {Langdef.OperatorUnary Langdef.PlusPlus $1}
     | Factor '--'   {Langdef.OperatorUnary Langdef.MinusMinus $1}
     | Factor        {$1}

Lit : Factor         {$1}
    | '(' Tuples ')' {Langdef.TypeTuples $2}

Tuples : Expr ',' Tuples {$1:$3}
       | Expr ',' Expr {Langdef.Litteral Langdef.LTuples [$1]++[$3]}

Factor : 'int' int  {Langdef.Litteral Langdef.TypeInt Langdef.LInt $1}
       | 'bool' bool {Langdef.Litteral Langdef.LBool $1}
{
    parseError :: [Token] -> a
    parseError x = error ("parsing error" ++ show x)
}









