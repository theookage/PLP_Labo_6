{
    module Parser where 
    import lexer.x
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


%%

Spec : Decl {Decl $1}
     | Express  {Expr $1}

Decl : const name '=' Expr {VarConst $2 $4}
     | fct Type name '(' Tuples ')' {Fct $2 $3 $5}
     | fct Type name '('')'         {Fct $2 [] $5}

Expr    : Factor             {Factor $1}
        | name               {Ref $1}
        | fct '(' Tuples ')' {AppFonction $2 $4}
        | Parenth            {$1}


Parenth : '(' Express ')' {Parenth $2}
        | '(' Cond ')'    {Parenth $2}


Exp : let name '=' Exp in Exp {Let $2 $4 $6}
    | Expr                   { Expr $1 }

IfThenElse : if '(' Cond ')' then smth {If $3 $6}
           | if '(' Cond ')' then smth else smthelse {If $3 $6 $8}

Cond : Cond '||' Cond {Or $1 $3}
     | Cond '&&' Cond {And $1 $3}
     | Cond '==' Cond {Equals $1 $3}
     | true           {Bool $1}
     | false          {Bool $1}
     | Factor         {Factor $1}

Tuples : Tuples ',' Expr {Expr $3}
       | Expr {Expr $1}

Term : Term '+' Term {Plus $1 $3}
     | Term '-' Term {Minus $1 $3}
     | Term '*' Term {Mult $1 $3}
     | Term '/' Term {Div $1 $3}
     | Factor '++'   {Plusplus $1}
     | Factor '--'   {MinusMinus $1}
     | Factor        {Factor $1}

Lit : Factor {Factor $1}
    | '(' Tuples ')' {Tuples $1}

Factor : int {Int $1}
       | bool {Bool $1}



    {
        parseError :: [Token] -> a
        parseError _ = error "parsing error"
    }

Type Name = String

data Spec 
    = Decl declaration 
    | Expr expression
    deriving (Show)

data Decl 
    = Var Const (Name) 
    | Fct Type [Expr]

data Expr
    = Litteral 
    | Ref String
    | AppFonction
    | Brack
    | Let 
    | Pattern
    | OpUnair Expr
    | OpBin Expr Expr 
    | OpComp Expr Expr 




data Lit
    = 



