{-# OPTIONS_GHC -w #-}
module Parser (parser) where 
    import Langdef
    import Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,117) ([28672,16,24,0,1536,0,0,16384,0,0,16,0,0,0,0,0,0,0,829,0,12288,0,1024,0,0,0,0,0,0,4208,0,0,16384,0,512,0,49600,0,0,0,0,0,0,1536,0,32768,1,0,96,0,6144,0,0,6,0,384,0,24576,0,0,1024,0,0,8,49152,65,0,12400,0,0,0,0,0,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,8,0,0,0,0,0,28672,16,0,0,0,0,0,0,0,4,8192,0,0,0,0,0,0,0,0,28672,16,0,0,64,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_Parser","Spec","Decl","Expr","Arg","Exp","Op","Lit","Tuples","Factor","name","int","bool","let","in","if","then","else","'('","')'","'=='","'='","'&&'","'||'","'+'","'-'","'++'","'--'","'*'","'/'","','","true","false","const","type","%eof"]
        bit_start = st Prelude.* 38
        bit_end = (st Prelude.+ 1) Prelude.* 38
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..37]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (13) = happyShift action_9
action_0 (14) = happyShift action_10
action_0 (15) = happyShift action_11
action_0 (21) = happyShift action_12
action_0 (36) = happyShift action_3
action_0 (37) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_6
action_0 (9) = happyGoto action_7
action_0 (12) = happyGoto action_8
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (36) = happyShift action_3
action_1 (37) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (13) = happyShift action_26
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (13) = happyShift action_25
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (38) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_2

action_7 (23) = happyShift action_18
action_7 (25) = happyShift action_19
action_7 (26) = happyShift action_20
action_7 (27) = happyShift action_21
action_7 (28) = happyShift action_22
action_7 (31) = happyShift action_23
action_7 (32) = happyShift action_24
action_7 _ = happyReduce_11

action_8 (22) = happyReduce_25
action_8 (29) = happyShift action_16
action_8 (30) = happyShift action_17
action_8 (33) = happyReduce_25
action_8 (38) = happyReduce_25
action_8 _ = happyReduce_25

action_9 (21) = happyShift action_15
action_9 _ = happyReduce_7

action_10 _ = happyReduce_30

action_11 _ = happyReduce_31

action_12 (13) = happyShift action_9
action_12 (14) = happyShift action_10
action_12 (15) = happyShift action_11
action_12 (21) = happyShift action_12
action_12 (6) = happyGoto action_13
action_12 (7) = happyGoto action_14
action_12 (9) = happyGoto action_7
action_12 (12) = happyGoto action_8
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (33) = happyShift action_40
action_13 _ = happyReduce_12

action_14 (22) = happyShift action_39
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (13) = happyShift action_9
action_15 (14) = happyShift action_10
action_15 (15) = happyShift action_11
action_15 (21) = happyShift action_12
action_15 (22) = happyShift action_38
action_15 (6) = happyGoto action_13
action_15 (7) = happyGoto action_37
action_15 (9) = happyGoto action_7
action_15 (12) = happyGoto action_8
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_23

action_17 _ = happyReduce_24

action_18 (14) = happyShift action_10
action_18 (15) = happyShift action_11
action_18 (9) = happyGoto action_36
action_18 (12) = happyGoto action_30
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (14) = happyShift action_10
action_19 (15) = happyShift action_11
action_19 (9) = happyGoto action_35
action_19 (12) = happyGoto action_30
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (14) = happyShift action_10
action_20 (15) = happyShift action_11
action_20 (9) = happyGoto action_34
action_20 (12) = happyGoto action_30
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (14) = happyShift action_10
action_21 (15) = happyShift action_11
action_21 (9) = happyGoto action_33
action_21 (12) = happyGoto action_30
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (14) = happyShift action_10
action_22 (15) = happyShift action_11
action_22 (9) = happyGoto action_32
action_22 (12) = happyGoto action_30
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (14) = happyShift action_10
action_23 (15) = happyShift action_11
action_23 (9) = happyGoto action_31
action_23 (12) = happyGoto action_30
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (14) = happyShift action_10
action_24 (15) = happyShift action_11
action_24 (9) = happyGoto action_29
action_24 (12) = happyGoto action_30
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (21) = happyShift action_28
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (24) = happyShift action_27
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (13) = happyShift action_9
action_27 (14) = happyShift action_10
action_27 (15) = happyShift action_11
action_27 (21) = happyShift action_12
action_27 (6) = happyGoto action_46
action_27 (9) = happyGoto action_7
action_27 (12) = happyGoto action_8
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (13) = happyShift action_9
action_28 (14) = happyShift action_10
action_28 (15) = happyShift action_11
action_28 (21) = happyShift action_12
action_28 (22) = happyShift action_45
action_28 (6) = happyGoto action_43
action_28 (9) = happyGoto action_7
action_28 (11) = happyGoto action_44
action_28 (12) = happyGoto action_8
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (23) = happyShift action_18
action_29 (25) = happyShift action_19
action_29 (26) = happyShift action_20
action_29 (27) = happyShift action_21
action_29 (28) = happyShift action_22
action_29 (31) = happyShift action_23
action_29 (32) = happyShift action_24
action_29 _ = happyReduce_22

action_30 (29) = happyShift action_16
action_30 (30) = happyShift action_17
action_30 _ = happyReduce_25

action_31 (23) = happyShift action_18
action_31 (25) = happyShift action_19
action_31 (26) = happyShift action_20
action_31 (27) = happyShift action_21
action_31 (28) = happyShift action_22
action_31 (31) = happyShift action_23
action_31 (32) = happyShift action_24
action_31 _ = happyReduce_18

action_32 (23) = happyShift action_18
action_32 (25) = happyShift action_19
action_32 (26) = happyShift action_20
action_32 (27) = happyShift action_21
action_32 (28) = happyShift action_22
action_32 (31) = happyShift action_23
action_32 (32) = happyShift action_24
action_32 _ = happyReduce_17

action_33 (23) = happyShift action_18
action_33 (25) = happyShift action_19
action_33 (26) = happyShift action_20
action_33 (27) = happyShift action_21
action_33 (28) = happyShift action_22
action_33 (31) = happyShift action_23
action_33 (32) = happyShift action_24
action_33 _ = happyReduce_16

action_34 (23) = happyShift action_18
action_34 (25) = happyShift action_19
action_34 (26) = happyShift action_20
action_34 (27) = happyShift action_21
action_34 (28) = happyShift action_22
action_34 (31) = happyShift action_23
action_34 (32) = happyShift action_24
action_34 _ = happyReduce_19

action_35 (23) = happyShift action_18
action_35 (25) = happyShift action_19
action_35 (26) = happyShift action_20
action_35 (27) = happyShift action_21
action_35 (28) = happyShift action_22
action_35 (31) = happyShift action_23
action_35 (32) = happyShift action_24
action_35 _ = happyReduce_20

action_36 (23) = happyShift action_18
action_36 (25) = happyShift action_19
action_36 (26) = happyShift action_20
action_36 (27) = happyShift action_21
action_36 (28) = happyShift action_22
action_36 (31) = happyShift action_23
action_36 (32) = happyShift action_24
action_36 _ = happyReduce_21

action_37 (22) = happyShift action_42
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_9

action_39 _ = happyReduce_10

action_40 (13) = happyShift action_9
action_40 (14) = happyShift action_10
action_40 (15) = happyShift action_11
action_40 (21) = happyShift action_12
action_40 (6) = happyGoto action_13
action_40 (7) = happyGoto action_41
action_40 (9) = happyGoto action_7
action_40 (12) = happyGoto action_8
action_40 _ = happyFail (happyExpListPerState 40)

action_41 _ = happyReduce_13

action_42 _ = happyReduce_8

action_43 (33) = happyShift action_48
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (22) = happyShift action_47
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_5

action_46 _ = happyReduce_3

action_47 _ = happyReduce_4

action_48 (13) = happyShift action_9
action_48 (14) = happyShift action_10
action_48 (15) = happyShift action_11
action_48 (21) = happyShift action_12
action_48 (6) = happyGoto action_49
action_48 (9) = happyGoto action_7
action_48 (11) = happyGoto action_50
action_48 (12) = happyGoto action_8
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (33) = happyShift action_48
action_49 _ = happyReduce_29

action_50 _ = happyReduce_28

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (DataLang.Decl happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (DataLang.Expr happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (lexer.name happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (DataLang.VarConst happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 5 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn11  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (lexer.name happy_var_2)) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (DataLang.Fct happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 4 5 happyReduction_5
happyReduction_5 (_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (lexer.name happy_var_2)) `HappyStk`
	(HappyTerminal happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (DataLang.Fct happy_var_1 happy_var_2 []
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  6 happyReduction_6
happyReduction_6 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn6
		 (DataLang.Factor happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  6 happyReduction_7
happyReduction_7 (HappyTerminal (lexer.name happy_var_1))
	 =  HappyAbsSyn6
		 (DataLang.Ref happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 6 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (lexer.name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (DataLang.AppFonction happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_9 = happySpecReduce_3  6 happyReduction_9
happyReduction_9 _
	_
	(HappyTerminal (lexer.name happy_var_1))
	 =  HappyAbsSyn6
		 (DataLang.AppFonction happy_var_1 []
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 _
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  6 happyReduction_11
happyReduction_11 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  7 happyReduction_12
happyReduction_12 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happyReduce 6 8 happyReduction_14
happyReduction_14 ((HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (lexer.name happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (DataLang.Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_15 = happySpecReduce_1  8 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (DataLang.Expr happy_var_1
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  9 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorUnary DataLang.Plus happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  9 happyReduction_17
happyReduction_17 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorUnary DataLang.Minus happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  9 happyReduction_18
happyReduction_18 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorUnary DataLang.Mult happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  9 happyReduction_19
happyReduction_19 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorUnary DataLang.Or happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  9 happyReduction_20
happyReduction_20 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorUnary DataLang.And happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  9 happyReduction_21
happyReduction_21 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorUnary DataLang.Equals happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorUnary DataLang.Divide happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_2  9 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorBinary DataLang.Plusplus happy_var_1
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_2  9 happyReduction_24
happyReduction_24 _
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (DataLang.OperatorBinary DataLang.Minusminus happy_var_1
	)
happyReduction_24 _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_1  9 happyReduction_25
happyReduction_25 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn9
		 (Factor happy_var_1
	)
happyReduction_25 _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_1  10 happyReduction_26
happyReduction_26 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (Factor happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  10 happyReduction_27
happyReduction_27 _
	_
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn10
		 (Tuples happy_var_1
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  11 happyReduction_29
happyReduction_29 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]++[happy_var_3]
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_1  12 happyReduction_30
happyReduction_30 (HappyTerminal (lexer.Int happy_var_1))
	 =  HappyAbsSyn12
		 (DataLang.TypeInt happy_var_1
	)
happyReduction_30 _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  12 happyReduction_31
happyReduction_31 (HappyTerminal happy_var_1)
	 =  HappyAbsSyn12
		 (DataLang.TypeBool happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 38 38 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	lexer.name happy_dollar_dollar -> cont 13;
	lexer.Int happy_dollar_dollar -> cont 14;
	lexer.Bool -> cont 15;
	lexer.Let -> cont 16;
	lexer.In -> cont 17;
	lexer.If -> cont 18;
	lexer.Then -> cont 19;
	lexer.Else -> cont 20;
	lexer.LParen -> cont 21;
	lexer.RParen -> cont 22;
	lexer.Equals -> cont 23;
	lexer.Eq -> cont 24;
	lexer.And -> cont 25;
	lexer.Or -> cont 26;
	lexer.Plus -> cont 27;
	lexer.Minus -> cont 28;
	lexer.Plusplus -> cont 29;
	lexer.Minusminus -> cont 30;
	lexer.Mult -> cont 31;
	lexer.Divide -> cont 32;
	lexer.Comma -> cont 33;
	lexer.True -> cont 34;
	lexer.False -> cont 35;
	lexer.Const -> cont 36;
	lexer.Type -> cont 37;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 38 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
Parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
        parseError _ = error "parsing error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
