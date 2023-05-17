{-# OPTIONS_GHC -w #-}
module Parser  where 
import Lexer
import qualified Langdef
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
happyExpList = Happy_Data_Array.listArray (0,174) ([61440,49154,1,0,7,0,0,4,0,16,0,0,0,0,0,0,0,0,8168,0,0,0,0,0,0,0,512,0,0,0,0,0,1024,0,61440,2,0,65440,0,64,0,256,0,4096,0,3008,0,12032,0,48128,0,61440,2,49152,11,0,47,0,0,0,0,0,3008,0,12032,0,0,4,0,2,49152,11,0,47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,65152,3,256,0,752,0,0,0,0,0,48128,0,0,16360,0,0,0,0,0,64064,7,0,0,3008,0,32768,510,0,1,0,0,49152,11,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Spec","Decl","Expr","Arg","Op","Type","Lit","Tuples","Factor","name","int","bool","let","in","'('","')'","'=='","'='","'&&'","'||'","'+'","'-'","'++'","'--'","'*'","'/'","','","'const'","'int'","'bool'","%eof"]
        bit_start = st Prelude.* 34
        bit_end = (st Prelude.+ 1) Prelude.* 34
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..33]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (13) = happyShift action_12
action_0 (14) = happyShift action_13
action_0 (15) = happyShift action_14
action_0 (16) = happyShift action_15
action_0 (18) = happyShift action_16
action_0 (31) = happyShift action_4
action_0 (32) = happyShift action_5
action_0 (33) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_8
action_0 (8) = happyGoto action_9
action_0 (9) = happyGoto action_3
action_0 (10) = happyGoto action_10
action_0 (12) = happyGoto action_11
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (31) = happyShift action_4
action_1 (32) = happyShift action_5
action_1 (33) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 (9) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (13) = happyShift action_32
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (13) = happyShift action_31
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_22

action_6 _ = happyReduce_23

action_7 (34) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (20) = happyShift action_22
action_8 (22) = happyShift action_23
action_8 (23) = happyShift action_24
action_8 (24) = happyShift action_25
action_8 (25) = happyShift action_26
action_8 (26) = happyShift action_27
action_8 (27) = happyShift action_28
action_8 (28) = happyShift action_29
action_8 (29) = happyShift action_30
action_8 _ = happyReduce_2

action_9 _ = happyReduce_9

action_10 _ = happyReduce_10

action_11 _ = happyReduce_24

action_12 (18) = happyShift action_21
action_12 _ = happyReduce_5

action_13 _ = happyReduce_28

action_14 _ = happyReduce_29

action_15 (13) = happyShift action_20
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (13) = happyShift action_12
action_16 (14) = happyShift action_13
action_16 (15) = happyShift action_14
action_16 (16) = happyShift action_15
action_16 (18) = happyShift action_16
action_16 (6) = happyGoto action_17
action_16 (7) = happyGoto action_18
action_16 (8) = happyGoto action_9
action_16 (10) = happyGoto action_10
action_16 (11) = happyGoto action_19
action_16 (12) = happyGoto action_11
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (20) = happyShift action_22
action_17 (22) = happyShift action_23
action_17 (23) = happyShift action_24
action_17 (24) = happyShift action_25
action_17 (25) = happyShift action_26
action_17 (26) = happyShift action_27
action_17 (27) = happyShift action_28
action_17 (28) = happyShift action_29
action_17 (29) = happyShift action_30
action_17 (30) = happyShift action_47
action_17 _ = happyReduce_11

action_18 (19) = happyShift action_46
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (19) = happyShift action_45
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (21) = happyShift action_44
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (13) = happyShift action_12
action_21 (14) = happyShift action_13
action_21 (15) = happyShift action_14
action_21 (16) = happyShift action_15
action_21 (18) = happyShift action_16
action_21 (6) = happyGoto action_42
action_21 (7) = happyGoto action_43
action_21 (8) = happyGoto action_9
action_21 (10) = happyGoto action_10
action_21 (12) = happyGoto action_11
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (13) = happyShift action_12
action_22 (14) = happyShift action_13
action_22 (15) = happyShift action_14
action_22 (16) = happyShift action_15
action_22 (18) = happyShift action_16
action_22 (6) = happyGoto action_41
action_22 (8) = happyGoto action_9
action_22 (10) = happyGoto action_10
action_22 (12) = happyGoto action_11
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (13) = happyShift action_12
action_23 (14) = happyShift action_13
action_23 (15) = happyShift action_14
action_23 (16) = happyShift action_15
action_23 (18) = happyShift action_16
action_23 (6) = happyGoto action_40
action_23 (8) = happyGoto action_9
action_23 (10) = happyGoto action_10
action_23 (12) = happyGoto action_11
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (13) = happyShift action_12
action_24 (14) = happyShift action_13
action_24 (15) = happyShift action_14
action_24 (16) = happyShift action_15
action_24 (18) = happyShift action_16
action_24 (6) = happyGoto action_39
action_24 (8) = happyGoto action_9
action_24 (10) = happyGoto action_10
action_24 (12) = happyGoto action_11
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (13) = happyShift action_12
action_25 (14) = happyShift action_13
action_25 (15) = happyShift action_14
action_25 (16) = happyShift action_15
action_25 (18) = happyShift action_16
action_25 (6) = happyGoto action_38
action_25 (8) = happyGoto action_9
action_25 (10) = happyGoto action_10
action_25 (12) = happyGoto action_11
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (13) = happyShift action_12
action_26 (14) = happyShift action_13
action_26 (15) = happyShift action_14
action_26 (16) = happyShift action_15
action_26 (18) = happyShift action_16
action_26 (6) = happyGoto action_37
action_26 (8) = happyGoto action_9
action_26 (10) = happyGoto action_10
action_26 (12) = happyGoto action_11
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_20

action_28 _ = happyReduce_21

action_29 (13) = happyShift action_12
action_29 (14) = happyShift action_13
action_29 (15) = happyShift action_14
action_29 (16) = happyShift action_15
action_29 (18) = happyShift action_16
action_29 (6) = happyGoto action_36
action_29 (8) = happyGoto action_9
action_29 (10) = happyGoto action_10
action_29 (12) = happyGoto action_11
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (13) = happyShift action_12
action_30 (14) = happyShift action_13
action_30 (15) = happyShift action_14
action_30 (16) = happyShift action_15
action_30 (18) = happyShift action_16
action_30 (6) = happyGoto action_35
action_30 (8) = happyGoto action_9
action_30 (10) = happyGoto action_10
action_30 (12) = happyGoto action_11
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (21) = happyShift action_34
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (18) = happyShift action_33
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (13) = happyShift action_12
action_33 (14) = happyShift action_13
action_33 (15) = happyShift action_14
action_33 (16) = happyShift action_15
action_33 (18) = happyShift action_16
action_33 (6) = happyGoto action_42
action_33 (7) = happyGoto action_55
action_33 (8) = happyGoto action_9
action_33 (10) = happyGoto action_10
action_33 (12) = happyGoto action_11
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (13) = happyShift action_12
action_34 (14) = happyShift action_13
action_34 (15) = happyShift action_14
action_34 (16) = happyShift action_15
action_34 (18) = happyShift action_16
action_34 (6) = happyGoto action_54
action_34 (8) = happyGoto action_9
action_34 (10) = happyGoto action_10
action_34 (12) = happyGoto action_11
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (20) = happyShift action_22
action_35 (22) = happyShift action_23
action_35 (23) = happyShift action_24
action_35 (24) = happyShift action_25
action_35 (25) = happyShift action_26
action_35 (26) = happyShift action_27
action_35 (27) = happyShift action_28
action_35 (28) = happyShift action_29
action_35 (29) = happyShift action_30
action_35 _ = happyReduce_16

action_36 (20) = happyShift action_22
action_36 (22) = happyShift action_23
action_36 (23) = happyShift action_24
action_36 (24) = happyShift action_25
action_36 (25) = happyShift action_26
action_36 (26) = happyShift action_27
action_36 (27) = happyShift action_28
action_36 (28) = happyShift action_29
action_36 (29) = happyShift action_30
action_36 _ = happyReduce_15

action_37 (20) = happyShift action_22
action_37 (22) = happyShift action_23
action_37 (23) = happyShift action_24
action_37 (24) = happyShift action_25
action_37 (25) = happyShift action_26
action_37 (26) = happyShift action_27
action_37 (27) = happyShift action_28
action_37 (28) = happyShift action_29
action_37 (29) = happyShift action_30
action_37 _ = happyReduce_14

action_38 (20) = happyShift action_22
action_38 (22) = happyShift action_23
action_38 (23) = happyShift action_24
action_38 (24) = happyShift action_25
action_38 (25) = happyShift action_26
action_38 (26) = happyShift action_27
action_38 (27) = happyShift action_28
action_38 (28) = happyShift action_29
action_38 (29) = happyShift action_30
action_38 _ = happyReduce_13

action_39 (20) = happyShift action_22
action_39 (22) = happyShift action_23
action_39 (23) = happyShift action_24
action_39 (24) = happyShift action_25
action_39 (25) = happyShift action_26
action_39 (26) = happyShift action_27
action_39 (27) = happyShift action_28
action_39 (28) = happyShift action_29
action_39 (29) = happyShift action_30
action_39 _ = happyReduce_17

action_40 (20) = happyShift action_22
action_40 (22) = happyShift action_23
action_40 (23) = happyShift action_24
action_40 (24) = happyShift action_25
action_40 (25) = happyShift action_26
action_40 (26) = happyShift action_27
action_40 (27) = happyShift action_28
action_40 (28) = happyShift action_29
action_40 (29) = happyShift action_30
action_40 _ = happyReduce_18

action_41 (20) = happyShift action_22
action_41 (22) = happyShift action_23
action_41 (23) = happyShift action_24
action_41 (24) = happyShift action_25
action_41 (25) = happyShift action_26
action_41 (26) = happyShift action_27
action_41 (27) = happyShift action_28
action_41 (28) = happyShift action_29
action_41 (29) = happyShift action_30
action_41 _ = happyReduce_19

action_42 (20) = happyShift action_22
action_42 (22) = happyShift action_23
action_42 (23) = happyShift action_24
action_42 (24) = happyShift action_25
action_42 (25) = happyShift action_26
action_42 (26) = happyShift action_27
action_42 (27) = happyShift action_28
action_42 (28) = happyShift action_29
action_42 (29) = happyShift action_30
action_42 (30) = happyShift action_53
action_42 _ = happyReduce_11

action_43 (19) = happyShift action_52
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (13) = happyShift action_12
action_44 (14) = happyShift action_13
action_44 (15) = happyShift action_14
action_44 (16) = happyShift action_15
action_44 (18) = happyShift action_16
action_44 (6) = happyGoto action_51
action_44 (8) = happyGoto action_9
action_44 (10) = happyGoto action_10
action_44 (12) = happyGoto action_11
action_44 _ = happyFail (happyExpListPerState 44)

action_45 _ = happyReduce_25

action_46 _ = happyReduce_8

action_47 (13) = happyShift action_12
action_47 (14) = happyShift action_13
action_47 (15) = happyShift action_14
action_47 (16) = happyShift action_15
action_47 (18) = happyShift action_16
action_47 (6) = happyGoto action_48
action_47 (7) = happyGoto action_49
action_47 (8) = happyGoto action_9
action_47 (10) = happyGoto action_10
action_47 (11) = happyGoto action_50
action_47 (12) = happyGoto action_11
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (19) = happyReduce_26
action_48 (20) = happyShift action_22
action_48 (22) = happyShift action_23
action_48 (23) = happyShift action_24
action_48 (24) = happyShift action_25
action_48 (25) = happyShift action_26
action_48 (26) = happyShift action_27
action_48 (27) = happyShift action_28
action_48 (28) = happyShift action_29
action_48 (29) = happyShift action_30
action_48 (30) = happyShift action_47
action_48 _ = happyReduce_26

action_49 _ = happyReduce_12

action_50 _ = happyReduce_27

action_51 (17) = happyShift action_57
action_51 (20) = happyShift action_22
action_51 (22) = happyShift action_23
action_51 (23) = happyShift action_24
action_51 (24) = happyShift action_25
action_51 (25) = happyShift action_26
action_51 (26) = happyShift action_27
action_51 (27) = happyShift action_28
action_51 (28) = happyShift action_29
action_51 (29) = happyShift action_30
action_51 _ = happyFail (happyExpListPerState 51)

action_52 _ = happyReduce_7

action_53 (13) = happyShift action_12
action_53 (14) = happyShift action_13
action_53 (15) = happyShift action_14
action_53 (16) = happyShift action_15
action_53 (18) = happyShift action_16
action_53 (6) = happyGoto action_42
action_53 (7) = happyGoto action_49
action_53 (8) = happyGoto action_9
action_53 (10) = happyGoto action_10
action_53 (12) = happyGoto action_11
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (20) = happyShift action_22
action_54 (22) = happyShift action_23
action_54 (23) = happyShift action_24
action_54 (24) = happyShift action_25
action_54 (25) = happyShift action_26
action_54 (26) = happyShift action_27
action_54 (27) = happyShift action_28
action_54 (28) = happyShift action_29
action_54 (29) = happyShift action_30
action_54 _ = happyReduce_3

action_55 (19) = happyShift action_56
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_4

action_57 (13) = happyShift action_12
action_57 (14) = happyShift action_13
action_57 (15) = happyShift action_14
action_57 (16) = happyShift action_15
action_57 (18) = happyShift action_16
action_57 (6) = happyGoto action_58
action_57 (8) = happyGoto action_9
action_57 (10) = happyGoto action_10
action_57 (12) = happyGoto action_11
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (20) = happyShift action_22
action_58 (22) = happyShift action_23
action_58 (23) = happyShift action_24
action_58 (24) = happyShift action_25
action_58 (25) = happyShift action_26
action_58 (26) = happyShift action_27
action_58 (27) = happyShift action_28
action_58 (28) = happyShift action_29
action_58 (29) = happyShift action_30
action_58 _ = happyReduce_6

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
	(HappyAbsSyn9  happy_var_1) `HappyStk`
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
		 (Langdef.Parenth happy_var_2
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn6
		 (Langdef.Litteral happy_var_1
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
happyReduction_13 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Plus happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  8 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Minus happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  8 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Mult happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  8 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Divide happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  8 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Or happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  8 happyReduction_18
happyReduction_18 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.And happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  8 happyReduction_19
happyReduction_19 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorBinary Langdef.Equals happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  8 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorUnary Langdef.PlusPlus happy_var_1
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_2  8 happyReduction_21
happyReduction_21 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 (Langdef.OperatorUnary Langdef.MinusMinus happy_var_1
	)
happyReduction_21 _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  9 happyReduction_22
happyReduction_22 _
	 =  HappyAbsSyn9
		 (Langdef.TypeInt
	)

happyReduce_23 = happySpecReduce_1  9 happyReduction_23
happyReduction_23 _
	 =  HappyAbsSyn9
		 (Langdef.TypeBool
	)

happyReduce_24 = happySpecReduce_1  10 happyReduction_24
happyReduction_24 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  10 happyReduction_25
happyReduction_25 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Langdef.LTuples happy_var_2
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  11 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]++[happy_var_3]
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  12 happyReduction_28
happyReduction_28 (HappyTerminal (Int happy_var_1))
	 =  HappyAbsSyn12
		 (Langdef.LInt happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  12 happyReduction_29
happyReduction_29 (HappyTerminal (Bool happy_var_1))
	 =  HappyAbsSyn12
		 (Langdef.LBool happy_var_1
	)
happyReduction_29 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 34 34 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Name happy_dollar_dollar -> cont 13;
	Int happy_dollar_dollar -> cont 14;
	Bool happy_dollar_dollar -> cont 15;
	Let -> cont 16;
	In -> cont 17;
	LParen -> cont 18;
	RParen -> cont 19;
	Equals -> cont 20;
	Eq -> cont 21;
	And -> cont 22;
	Or -> cont 23;
	Plus -> cont 24;
	Minus -> cont 25;
	Plusplus -> cont 26;
	Minusminus -> cont 27;
	Mult -> cont 28;
	Divide -> cont 29;
	Comma -> cont 30;
	Const -> cont 31;
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
