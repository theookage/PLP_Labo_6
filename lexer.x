{
module Main (main) where
}

%wrapper "basic"

-- Définition du type de données pour les tokens
data Token
  = Var String          -- Variable constante
  | Int Int         -- Littéral entier
  | Bool Bool           -- Littéral booléen
  | Tuple           -- Fin de tuple
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
  | Plus                -- Opérateur d'addition
  | Minus               -- Opérateur de soustraction
  | Mult               -- Opérateur de multiplication
  | Divide              -- Opérateur de division
  | Plusplus            -- Opérateur d'incrément
  | Minusminus          -- Opérateur de décrément
  deriving (Eq, Show)

-- Définition de la grammaire lexicale avec Alex
tokens :-

  $white+  ;
  $digit = 0-9
  $alpha = [a-zA-Z]

  -- Règles pour les tokens
  {
    "let"              { \_ -> Let }
    "in"               { \_ -> In }
    "=="               { \_ -> Equals }
    "+"                { \_ -> Plus }
    "-"                { \_ -> Minus }
    "++"               { \_ -> Plusplus}
    "--"               {\_ -> MinusMinus}
    "*"                { \_ -> Mult }
    "/"                { \_ -> Divide }
    "("                { \_ -> LParen }
    ")"                { \_ -> RParen }
    ","                { \_ -> Tuple }
    "if"               { \_ -> If }
    "then"             { \_ -> Then }
    "else"             { \_ -> Else }
    "->"               { \_ -> FunArrow }
    $alpha([$alpha$digit']*) { \s -> Var s }
    $digit+            { \s -> Int (read s) }
    "True"             { \_ -> Bool True }
    "False"            { \_ -> Bool False }


main = do
  s <- getContents
  print (alexScanTokens s)
}