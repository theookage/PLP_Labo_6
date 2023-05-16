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
    bool     {Bool}
    let      {Let}
    in       {In}
    if       {If}
    then     {Then}
    else     {Else}
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
    true     {True}
    false    {False}
    const    {Const}
    type     {Type}


%%

Spec : Decl                         {Langdef.Decl $1}
     | Expr                         {Langdef.Expr $1}

Decl : const name '=' Expr          {Langdef.VarConst $2 $4}
     | type name '(' Tuples ')' {Langdef.Fct $1 $2 $4}
     | type name '('')'         {Langdef.Fct $1 $2 []}

Expr    : Factor                    {Langdef.Litteral $1}
        | name                      {Langdef.Ref $1}
        | name '(' Arg ')'           {Langdef.AppFonction $1 $3}
        | name '(' ')'               {Langdef.AppFonction $1 []}
        | '(' Arg ')'           {$1}
        | Op                        {$1}

Arg     : Expr {[$1]}
        | Expr ',' Arg {$1:$3}


Exp : let name '=' Exp in Exp {Langdef.Let $2 $4 $6}
    | Expr                    {Langdef.Expr $1 }

--IfThenElse : if '(' Cond ')' then smth {Langdef.If $3 $6}
--           | if '(' Cond ')' then smth else smthelse {Langdef.If $3 $6 $8}

Op   : Op '+' Op     {Langdef.OperatorUnary Langdef.Plus $1 $3}
     | Op '-' Op     {Langdef.OperatorUnary Langdef.Minus $1 $3}
     | Op '*' Op     {Langdef.OperatorUnary Langdef.Mult $1 $3}
     | Op '||' Op    {Langdef.OperatorUnary Langdef.Or $1 $3}
     | Op '&&' Op    {Langdef.OperatorUnary Langdef.And $1 $3}
     | Op '==' Op    {Langdef.OperatorUnary Langdef.Equals $1 $3}
     | Op '/' Op     {Langdef.OperatorUnary Langdef.Divide $1 $3}
     | Factor '++'   {Langdef.OperatorBinary Langdef.PlusPlus $1}
     | Factor '--'   {Langdef.OperatorBinary Langdef.MinusMinus $1}
     | Factor        {Factor $1}

Lit : Factor {Factor $1}
    | '(' Tuples ')' {Tuples $1}

Tuples : Expr ',' Tuples {$1:$3}
       | Expr ',' Expr {[$1]++[$3]}

Factor : int {Langdef.TypeInt $1}
       | bool {Langdef.TypeBool $1}

    {
        parseError :: [Token] -> a
        parseError _ = error "parsing error"
    }









