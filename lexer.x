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
    "int"              { \_ -> TInt}
    "bool"             { \_ -> TBool}
    "--"               {\_ -> Minusminus}
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
    "->"               { \_ -> FunArrow }
    $alpha([$alpha$digit]*) { \s -> Name s }
    $digit            { \s -> Int (read s) }
    "const"            { \_ -> Const }
{

-- Définition du type de données pour les tokens
data Token
  = Name String         
  | Int Int             -- Littéral entier
  | Bool Bool           -- Littéral booléen
  | Comma               -- Virgule
  | FunArrow            -- Flèche de fonction
  | Symbol String       -- Référence à des symboles
  | App                 -- Application de fonctions
  | LParen              -- Parenthèse ouvrante
  | RParen              -- Parenthèse fermante
  | Let                 -- Mot-clé "let"
  | In                  -- Mot-clé "in"
  | If
  | Then 
  | Else
  | Equals              -- Opérateur d'égalité
  | Eq
  | LAcol
  | RAcol
  | Or 
  | And
  | Plus                -- Opérateur d'addition
  | Minus               -- Opérateur de soustraction
  | Mult               -- Opérateur de multiplication
  | Divide              -- Opérateur de division
  | Plusplus            -- Opérateur d'incrément
  | Minusminus          -- Opérateur de décrément
  | Const 
  | TInt
  | TBool

  deriving (Eq, Show)

lexer = alexScanTokens
}