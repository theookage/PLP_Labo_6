module Langdef where

type Name = String

data Spec 
    = Decl Decl 
    | Expr Expr
    deriving (Show) 

data Decl 
    = VarConst String Expr
    | Fct Type String [Expr]
    deriving (Show) 

data Expr
    = Litteral Type Litteral
    | Ref String
    | AppFonction String [Expr]
    | Let [Decl] Expr
    | Pattern Expr
    | OperatorUnary OperatorUn Expr
    | OperatorBinary OperatorBi Expr Expr
    deriving (Show)

data OperatorUn 
    = PlusPlus | MinusMinus
    deriving (Show)

data OperatorBi =
    Equals | Or | And | Plus | Minus | Mult | Divide
    deriving (Show) 


data Type = TypeBool | TypeInt 
    deriving (Show)

data Litteral 
    = LBool Bool
    | LInt Int 
    | LTuples [Expr]
    deriving (Show) 
