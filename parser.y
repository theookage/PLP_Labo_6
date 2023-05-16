{
    module Parser where 
    import lexer.x
}

%name Parser
%tekentype { Token }
%error { parseError }

%token
    var      {lexer.Var $$}
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
    '+'      {lexer.Plus}
    '-'      {lexer.Minus}
    '++'     {lexer.Plusplus}
    '--'     {lexer.Minusminus}
    '*'      {lexer.Mult}
    '/'      {lexer.Divide}


%%

Spec : Decl {}
     | Expr {}

Exp : let var '=' Exp in Exp {Let $2 $4 $6}
    | Exp1                   { Expr $1 }

Expr : Factor {Factor $1}
     | Reference symbole
     | Application Fonction

IfThenElse : if 


Exp : '(' Tuples ')' {Tuples $2}
    | Expr      {Expr $2}

Tuples : Tuples ',' Expr {Expr $3}
       | Expr {Expr $3}

Expr : Expr '+' Term {Plus $1 $3}
     | Expr '-' Term {Minus $1 $3}
     | Term          {Term $1}

Term : Term '*' Factor {Mult $1 $3}
     | Term '/' Factor {Div $1 $3}
     | Factor '++'     {Plusplus $1}
     | Factor '--'     {MinusMinus}
     | Factor          {Factor $1}

Factor : int {Int $1}
       | var {Var $1}
       | bool {Bool $1}
       | '(' Expr ')' {}



    {
        parseError :: [Token] -> a
        parseError _ = error "parsing error"
    }


data Spec 
    = Decl
    | Expr

data Decl 
    = Var
    | fonc

data Expr
    = Lit
    | Ref
    | App
    | Brack
    | Loc
    | Pat
    | Op

data Lit
    = 



