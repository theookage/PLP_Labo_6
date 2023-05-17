-- Auteur Théo Coutaudier et Jérémie Santoro
{
module Lexer where
}


%wrapper "basic"

-- Définition de la grammaire lexicale avec Alex


  $digit = 0-9
  $alpha = [a-zA-Z]

tokens :-
  -- Règles pour les tokens
    "let"              { \_ -> Let }
    "in"               { \_ -> In }
    "=="               { \_ -> Equals }
    "+"                { \_ -> Plus }
    "-"                { \_ -> Minus }
    "++"               { \_ -> Plusplus}
    "case"             { \_ -> Case}
    "of"               { \_ -> Of}
    "int"              { \_ -> TInt}
    "bool"             { \_ -> TBool}
    "--"               { \_ -> Minusminus }
    "_"                { \_ -> Universal }
    "*"                { \_ -> Mult }
    "/"                { \_ -> Divide }
    "("                { \_ -> LParen }
    ")"                { \_ -> RParen }
    "{"                { \_ -> LAcol }
    "}"                { \_ -> RAcol }
    "||"               { \_ -> Or }
    "&&"               { \_ -> And }
    "="                { \_ -> Eq }
    ","                { \_ -> Comma }
    "if"               { \_ -> If }
    "then"             { \_ -> Then }
    "else"             { \_ -> Else }
    "->"               { \_ -> Arrow }
    $alpha([$alpha$digit]*) { \s -> Name s }
    $digit            { \s -> Int (read s) }
    "const"            { \_ -> Const }
{

-- Définition du type de données pour les tokens
data Token
  = Name String         
  | Int Int            
  | Bool Bool         
  | Comma              
  | FunArrow          
  | Symbol String       
  | App                
  | LParen             
  | RParen            
  | Let                
  | In                 
  | If
  | Then 
  | Else
  | Equals             
  | Eq
  | Case 
  | Of
  | Universal
  | LAcol
  | RAcol
  | Or 
  | And
  | Arrow
  | Plus                
  | Minus               
  | Mult             
  | Divide              
  | Plusplus            
  | Minusminus          
  | Const 
  | TInt
  | TBool

  deriving (Eq, Show)

lexer = alexScanTokens
}