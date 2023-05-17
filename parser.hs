{-# OPTIONS_GHC -w #-}
module Parser  where 
import Lexer
import qualified Langdef
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11
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

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,129) ([18432,57345,1,32768,1,0,0,2,0,8,0,0,0,0,0,0,825,0,0,0,3072,0,16,0,2,0,328,384,64,0,512,0,0,0,0,0,0,16384,0,32,0,128,0,2048,0,1312,1536,0,0,0,0,0,32768,1,0,6,0,24,0,96,0,384,0,1536,4096,0,0,2,18432,32769,8193,5,6,0,0,49152,0,0,0,0,0,0,0,0,0,0,0,0,16384,0,32,0,82,96,0,0,0,0,5248,6144,0,1024,0,0,0,0,0,8,0,0,0,328,384,2048,0,0,0,0,0,18432,32769,1,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Spec","Decl","Expr","Arg","Op","Lit","Tuples","Factor","name","int","bool","let","in","'('","')'","'=='","'='","'&&'","'||'","'+'","'-'","'++'","'--'","'*'","'/'","','","'const'","type","'int'","'bool'","%eof"]
        bit_start = st Prelude.* 34
        bit_end = (st Prelude.+ 1) Prelude.* 34
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..33]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (12) = happyShift action_10
action_0 (15) = happyShift action_11
action_0 (17) = happyShift action_12
action_0 (30) = happyShift action_3
action_0 (31) = happyShift action_4
action_0 (32) = happyShift action_13
action_0 (33) = happyShift action_14
action_0 (4) = happyGoto action_5
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_6
action_0 (8) = happyGoto action_7
action_0 (9) = happyGoto action_8
action_0 (11) = happyGoto action_9
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (30) = happyShift action_3
action_1 (31) = happyShift action_4
action_1 (5) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (12) = happyShift action_31
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (12) = happyShift action_30
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (34) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 _ = happyReduce_2

action_7 (19) = happyShift action_24
action_7 (22) = happyShift action_25
action_7 (23) = happyShift action_26
action_7 (24) = happyShift action_27
action_7 (27) = happyShift action_28
action_7 (28) = happyShift action_29
action_7 _ = happyReduce_9

action_8 _ = happyReduce_10

action_9 (16) = happyReduce_22
action_9 (18) = happyReduce_22
action_9 (25) = happyShift action_22
action_9 (26) = happyShift action_23
action_9 (29) = happyReduce_22
action_9 (34) = happyReduce_22
action_9 _ = happyReduce_21

action_10 (17) = happyShift action_21
action_10 _ = happyReduce_5

action_11 (12) = happyShift action_20
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (12) = happyShift action_10
action_12 (15) = happyShift action_11
action_12 (17) = happyShift action_12
action_12 (32) = happyShift action_13
action_12 (33) = happyShift action_14
action_12 (6) = happyGoto action_17
action_12 (7) = happyGoto action_18
action_12 (8) = happyGoto action_7
action_12 (9) = happyGoto action_8
action_12 (10) = happyGoto action_19
action_12 (11) = happyGoto action_9
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (13) = happyShift action_16
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (14) = happyShift action_15
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_27

action_16 _ = happyReduce_26

action_17 (29) = happyShift action_46
action_17 _ = happyReduce_11

action_18 (18) = happyShift action_45
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (18) = happyShift action_44
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (20) = happyShift action_43
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (12) = happyShift action_10
action_21 (15) = happyShift action_11
action_21 (17) = happyShift action_12
action_21 (32) = happyShift action_13
action_21 (33) = happyShift action_14
action_21 (6) = happyGoto action_41
action_21 (7) = happyGoto action_42
action_21 (8) = happyGoto action_7
action_21 (9) = happyGoto action_8
action_21 (11) = happyGoto action_9
action_21 _ = happyFail (happyExpListPerState 21)

action_22 _ = happyReduce_19

action_23 _ = happyReduce_20

action_24 (32) = happyShift action_13
action_24 (33) = happyShift action_14
action_24 (8) = happyGoto action_40
action_24 (11) = happyGoto action_35
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (32) = happyShift action_13
action_25 (33) = happyShift action_14
action_25 (8) = happyGoto action_39
action_25 (11) = happyGoto action_35
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (32) = happyShift action_13
action_26 (33) = happyShift action_14
action_26 (8) = happyGoto action_38
action_26 (11) = happyGoto action_35
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (32) = happyShift action_13
action_27 (33) = happyShift action_14
action_27 (8) = happyGoto action_37
action_27 (11) = happyGoto action_35
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (32) = happyShift action_13
action_28 (33) = happyShift action_14
action_28 (8) = happyGoto action_36
action_28 (11) = happyGoto action_35
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (32) = happyShift action_13
action_29 (33) = happyShift action_14
action_29 (8) = happyGoto action_34
action_29 (11) = happyGoto action_35
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (17) = happyShift action_33
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (20) = happyShift action_32
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (12) = happyShift action_10
action_32 (15) = happyShift action_11
action_32 (17) = happyShift action_12
action_32 (32) = happyShift action_13
action_32 (33) = happyShift action_14
action_32 (6) = happyGoto action_54
action_32 (8) = happyGoto action_7
action_32 (9) = happyGoto action_8
action_32 (11) = happyGoto action_9
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (12) = happyShift action_10
action_33 (15) = happyShift action_11
action_33 (17) = happyShift action_12
action_33 (32) = happyShift action_13
action_33 (33) = happyShift action_14
action_33 (6) = happyGoto action_41
action_33 (7) = happyGoto action_53
action_33 (8) = happyGoto action_7
action_33 (9) = happyGoto action_8
action_33 (11) = happyGoto action_9
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (19) = happyShift action_24
action_34 (22) = happyShift action_25
action_34 (23) = happyShift action_26
action_34 (24) = happyShift action_27
action_34 (27) = happyShift action_28
action_34 (28) = happyShift action_29
action_34 _ = happyReduce_18

action_35 (25) = happyShift action_22
action_35 (26) = happyShift action_23
action_35 _ = happyReduce_21

action_36 (19) = happyShift action_24
action_36 (22) = happyShift action_25
action_36 (23) = happyShift action_26
action_36 (24) = happyShift action_27
action_36 (27) = happyShift action_28
action_36 (28) = happyShift action_29
action_36 _ = happyReduce_15

action_37 (19) = happyShift action_24
action_37 (22) = happyShift action_25
action_37 (23) = happyShift action_26
action_37 (24) = happyShift action_27
action_37 (27) = happyShift action_28
action_37 (28) = happyShift action_29
action_37 _ = happyReduce_14

action_38 (19) = happyShift action_24
action_38 (22) = happyShift action_25
action_38 (23) = happyShift action_26
action_38 (24) = happyShift action_27
action_38 (27) = happyShift action_28
action_38 (28) = happyShift action_29
action_38 _ = happyReduce_13

action_39 (19) = happyShift action_24
action_39 (22) = happyShift action_25
action_39 (23) = happyShift action_26
action_39 (24) = happyShift action_27
action_39 (27) = happyShift action_28
action_39 (28) = happyShift action_29
action_39 _ = happyReduce_16

action_40 (19) = happyShift action_24
action_40 (22) = happyShift action_25
action_40 (23) = happyShift action_26
action_40 (24) = happyShift action_27
action_40 (27) = happyShift action_28
action_40 (28) = happyShift action_29
action_40 _ = happyReduce_17

action_41 (29) = happyShift action_52
action_41 _ = happyReduce_11

action_42 (18) = happyShift action_51
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (12) = happyShift action_10
action_43 (15) = happyShift action_11
action_43 (17) = happyShift action_12
action_43 (32) = happyShift action_13
action_43 (33) = happyShift action_14
action_43 (6) = happyGoto action_50
action_43 (8) = happyGoto action_7
action_43 (9) = happyGoto action_8
action_43 (11) = happyGoto action_9
action_43 _ = happyFail (happyExpListPerState 43)

action_44 _ = happyReduce_23

action_45 _ = happyReduce_8

action_46 (12) = happyShift action_10
action_46 (15) = happyShift action_11
action_46 (17) = happyShift action_12
action_46 (32) = happyShift action_13
action_46 (33) = happyShift action_14
action_46 (6) = happyGoto action_47
action_46 (7) = happyGoto action_48
action_46 (8) = happyGoto action_7
action_46 (9) = happyGoto action_8
action_46 (10) = happyGoto action_49
action_46 (11) = happyGoto action_9
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (18) = happyReduce_25
action_47 (29) = happyShift action_46
action_47 _ = happyReduce_25

action_48 _ = happyReduce_12

action_49 _ = happyReduce_24

action_50 (16) = happyShift action_56
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_7

action_52 (12) = happyShift action_10
action_52 (15) = happyShift action_11
action_52 (17) = happyShift action_12
action_52 (32) = happyShift action_13
action_52 (33) = happyShift action_14
action_52 (6) = happyGoto action_41
action_52 (7) = happyGoto action_48
action_52 (8) = happyGoto action_7
action_52 (9) = happyGoto action_8
action_52 (11) = happyGoto action_9
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (18) = happyShift action_55
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_3

action_55 _ = happyReduce_4

action_56 (12) = happyShift action_10
action_56 (15) = happyShift action_11
action_56 (17) = happyShift action_12
action_56 (32) = happyShift action_13
action_56 (33) = happyShift action_14
action_56 (6) = happyGoto action_57
action_56 (8) = happyGoto action_7
action_56 (9) = happyGoto action_8
action_56 (11) = happyGoto action_9
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_6

happyReduce_1 = happySpecReduce_1  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn4
		 (Langdef.Decl happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  4 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (Langdef.Expr happy_var_1
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Name happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Langdef.VarConst happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happyReduce 5 5 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Name happy_var_2)) `HappyStk`
	(HappyTerminal (Type happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (Langdef.Fct happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_5 = happySpecReduce_1  6 happyReduction_5
happyReduction_5 (HappyTerminal (Name happy_var_1))
	 =  HappyAbsSyn6
		 (Langdef.Ref happy_var_1
	)
happyReduction_5 _  = notHappyAtAll 

happyReduce_6 = happyReduce 6 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Name happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Langdef.Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_7 = happyReduce 4 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Langdef.AppFonction happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_8 = happySpecReduce_3  6 happyReduction_8
happyReduction_8 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_1  7 happyReduction_11
happyReduction_11 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_11 _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  8 happyReduction_13
happyReduction_13 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Plus happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  8 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Minus happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  8 happyReduction_15
happyReduction_15 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Mult happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  8 happyReduction_16
happyReduction_16 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Or happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Equals happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  8 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Divide happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  8 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorUnary Langdef.PlusPlus happy_var_1
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  8 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorUnary Langdef.MinusMinus happy_var_1
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  8 happyReduction_21
happyReduction_21 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Langdef.TypeTuples happy_var_2
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  10 happyReduction_24
happyReduction_24 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1:happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (Langdef.Litteral Langdef.LTuples [happy_var_1]++[happy_var_3]
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  11 happyReduction_26
happyReduction_26 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.Litteral Langdef.TypeInt Langdef.LInt happy_var_1
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_2  11 happyReduction_27
happyReduction_27 _
	(HappyTerminal happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.Litteral Langdef.LBool happy_var_1
	)
happyReduction_27 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 34 34 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Name happy_dollar_dollar -> cont 12;
	Int happy_dollar_dollar -> cont 13;
	Bool happy_dollar_dollar -> cont 14;
	Let -> cont 15;
	In -> cont 16;
	LParen -> cont 17;
	RParen -> cont 18;
	Equals -> cont 19;
	Eq -> cont 20;
	And -> cont 21;
	Or -> cont 22;
	Plus -> cont 23;
	Minus -> cont 24;
	Plusplus -> cont 25;
	Minusminus -> cont 26;
	Mult -> cont 27;
	Divide -> cont 28;
	Comma -> cont 29;
	Const -> cont 30;
	Type happy_dollar_dollar -> cont 31;
	TInt -> cont 32;
	TBool -> cont 33;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 34 tk tks = happyError' (tks, explist)
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
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
    parseError x = error ("parsing error" ++ show x)
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
