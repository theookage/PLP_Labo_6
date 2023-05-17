Auteur Théo Coutaudier

Type possible à utiliser : 
    int , bool 

Regle de nomencalture : 
-   Le nom doit commencer par une lettre (a - z) minuscule ou majuscule
    et continue avec des lettre ou des chiffres

Déclaration de fonction et variable constante : 

    - Déclarer une variable constante : 
        - const name = Expr     -> name = un string respectant la nomenclature
                                -> Expr = Une Expression 
        - Exemple : const x = 3
    
    - Déclarer une fonction : 
        - type name ( type arg1 {,type arg2 , ... })   -> Type de la fonction ou des paramètre (int, bool)
                                        -> name = un string respectant la nomenclature
                                        -> les arguements entre parenthèse
                                        -> 1er argument obligatoire (arg1)  
                                        -> plusieur arguements possible, séparer par une virgule
        - Exemple : Bool uneFonction(Int unParam)

Expression : 
    - Référence à des symboles :
        - name            -> name = = un string respectant la nomenclature qui represente le nom
        - Exemple : x

    - Litteraux Entier, Bouléen ou Tuples : 
        - Type possible int, bool, tuples
        - Tuples entre accolade, séparé par des , minimum 2 éléments
        - int négatif possible avec le symbole - 
        - Exemple : 42, True, {2, True} 

    - Application de fonction : 
        - name '(' arg1 {, arg2} ')'  -> name = un string désignant le nom de la fonction 
                            -> arg1 = les parametres de la fonction, au minimum 1, peu en avoir plus que 1. Séparé par une virgule
        - Exemple : uneFonction(42)

    - If :
        - if '( expr1 ')' then Expr {else Expr} -> expr1 = expression a testé.
                                                -> expr2 = expression executer si expr1 == true
                                                -> expr3 = optionnel, si la condition est fausse
        - Exemple : if(True) then 42 else 100

    - Expression parenthésé :
        - '(' expr ')' -> expr = une Expression
        - Exemple : (x)
    
    - Pattern Matching : 
        -  case expr1 of (value2 -> expr2) {(value3 -> expr3)} 
                                    -> expr1 = value a tester 
                                    
                                    -> value2 = value de correspondance 
            
                                    -> expr2 = expression à appliqué si expr1 == value2 

                                    -> Au minimum un pattern, peut en avoir plusieur
                                    
                                    -> value2 et value3 sont soit Int, soit un String, soit _ pour le cas par 
                                    défault

        - Exemple : case x of (42 -> True) (_, False)  

    - Déclaration locale avec un corps : 
        - let name = expr1 in expr2 -> name = string nom de la déclaration
                                    -> expr1 expr2 = des Expressions 
        - Exemple : let x = 42 in x + y
    
    - Opération Unaire : 
        - expr op   -> expr = une Expression 
                    -> op = opéarteur unaire: ++, --
        - Exemple : 42++

    - Opérateur Binaire : 
        - expr1 op expr2    -> expr1 et expr2 = des Expression 
                            -> op = opérateur 
                            -> opérateur arythmétique: +, -, /, *
                            -> opérateur conditionnel: ||, &&, ==
        - Exemple : 42 + 45
        - Exemple : True || False 






