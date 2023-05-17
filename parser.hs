{-# OPTIONS_GHC -w #-}
module Parser  where 
import Lexer
import qualified Langdef
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
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
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,322) ([32768,5271,3592,0,0,896,0,0,0,512,0,0,128,0,0,0,0,0,0,0,0,0,0,0,16384,255,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,2,0,0,1024,0,57344,1317,2,30720,33097,0,24064,8274,0,256,0,0,0,0,0,0,8180,0,32768,0,0,16384,511,0,512,0,0,62480,15,24064,8274,0,0,128,0,9696,517,0,18808,129,0,21086,32,32768,5271,8,57344,1317,2,30720,33097,0,0,0,0,0,0,0,9696,517,0,18808,129,0,0,2,0,1024,0,57344,1317,2,30720,33097,0,0,52480,0,0,13120,0,0,15568,0,0,3892,0,0,192,0,0,48,0,0,12,0,128,0,24064,8274,0,0,65352,0,0,1,0,0,0,0,21086,32,0,0,0,57344,1317,2,0,62464,31,0,0,0,0,0,0,0,0,0,16384,0,0,18446,32,0,32,0,0,53250,63,0,0,0,0,64768,3,0,8,0,0,0,0,18808,129,0,21086,32,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,9696,517,0,0,0,0,0,0,32768,5271,8,0,53760,63,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Spec","Decl","Expr","Patterns","Pattern","PatValue","Arg","Op","Type","Lit","Tuples","Factor","name","int","bool","let","in","if","then","else","case","of","'_'","'('","')'","'{'","'}'","'=='","'='","'&&'","'||'","'+'","'-'","'++'","'--'","'*'","'/'","','","'const'","'int'","'bool'","'->'","%eof"]
        bit_start = st Prelude.* 46
        bit_end = (st Prelude.+ 1) Prelude.* 46
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..45]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (16) = happyShift action_12
action_0 (17) = happyShift action_13
action_0 (18) = happyShift action_14
action_0 (19) = happyShift action_15
action_0 (21) = happyShift action_16
action_0 (24) = happyShift action_17
action_0 (27) = happyShift action_18
action_0 (29) = happyShift action_19
action_0 (36) = happyShift action_20
action_0 (42) = happyShift action_4
action_0 (43) = happyShift action_5
action_0 (44) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_8
action_0 (11) = happyGoto action_9
action_0 (12) = happyGoto action_3
action_0 (13) = happyGoto action_10
action_0 (15) = happyGoto action_11
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (42) = happyShift action_4
action_1 (43) = happyShift action_5
action_1 (44) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 (12) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (16) = happyShift action_40
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (16) = happyShift action_39
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_31

action_6 _ = happyReduce_32

action_7 (46) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (31) = happyShift action_30
action_8 (33) = happyShift action_31
action_8 (34) = happyShift action_32
action_8 (35) = happyShift action_33
action_8 (36) = happyShift action_34
action_8 (37) = happyShift action_35
action_8 (38) = happyShift action_36
action_8 (39) = happyShift action_37
action_8 (40) = happyShift action_38
action_8 _ = happyReduce_2

action_9 _ = happyReduce_12

action_10 _ = happyReduce_13

action_11 _ = happyReduce_33

action_12 (27) = happyShift action_29
action_12 _ = happyReduce_5

action_13 _ = happyReduce_37

action_14 _ = happyReduce_39

action_15 (16) = happyShift action_28
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (27) = happyShift action_27
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (16) = happyShift action_12
action_17 (17) = happyShift action_13
action_17 (18) = happyShift action_14
action_17 (19) = happyShift action_15
action_17 (21) = happyShift action_16
action_17 (24) = happyShift action_17
action_17 (27) = happyShift action_18
action_17 (29) = happyShift action_19
action_17 (36) = happyShift action_20
action_17 (6) = happyGoto action_26
action_17 (11) = happyGoto action_9
action_17 (13) = happyGoto action_10
action_17 (15) = happyGoto action_11
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (16) = happyShift action_12
action_18 (17) = happyShift action_13
action_18 (18) = happyShift action_14
action_18 (19) = happyShift action_15
action_18 (21) = happyShift action_16
action_18 (24) = happyShift action_17
action_18 (27) = happyShift action_18
action_18 (29) = happyShift action_19
action_18 (36) = happyShift action_20
action_18 (6) = happyGoto action_24
action_18 (10) = happyGoto action_25
action_18 (11) = happyGoto action_9
action_18 (13) = happyGoto action_10
action_18 (15) = happyGoto action_11
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (16) = happyShift action_12
action_19 (17) = happyShift action_13
action_19 (18) = happyShift action_14
action_19 (19) = happyShift action_15
action_19 (21) = happyShift action_16
action_19 (24) = happyShift action_17
action_19 (27) = happyShift action_18
action_19 (29) = happyShift action_19
action_19 (36) = happyShift action_20
action_19 (6) = happyGoto action_22
action_19 (11) = happyGoto action_9
action_19 (13) = happyGoto action_10
action_19 (14) = happyGoto action_23
action_19 (15) = happyGoto action_11
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (17) = happyShift action_21
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_38

action_22 (31) = happyShift action_30
action_22 (33) = happyShift action_31
action_22 (34) = happyShift action_32
action_22 (35) = happyShift action_33
action_22 (36) = happyShift action_34
action_22 (37) = happyShift action_35
action_22 (38) = happyShift action_36
action_22 (39) = happyShift action_37
action_22 (40) = happyShift action_38
action_22 (41) = happyShift action_57
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (30) = happyShift action_56
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (31) = happyShift action_30
action_24 (33) = happyShift action_31
action_24 (34) = happyShift action_32
action_24 (35) = happyShift action_33
action_24 (36) = happyShift action_34
action_24 (37) = happyShift action_35
action_24 (38) = happyShift action_36
action_24 (39) = happyShift action_37
action_24 (40) = happyShift action_38
action_24 (41) = happyShift action_55
action_24 _ = happyReduce_20

action_25 (28) = happyShift action_54
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (25) = happyShift action_53
action_26 (31) = happyShift action_30
action_26 (33) = happyShift action_31
action_26 (34) = happyShift action_32
action_26 (35) = happyShift action_33
action_26 (36) = happyShift action_34
action_26 (37) = happyShift action_35
action_26 (38) = happyShift action_36
action_26 (39) = happyShift action_37
action_26 (40) = happyShift action_38
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (16) = happyShift action_12
action_27 (17) = happyShift action_13
action_27 (18) = happyShift action_14
action_27 (19) = happyShift action_15
action_27 (21) = happyShift action_16
action_27 (24) = happyShift action_17
action_27 (27) = happyShift action_18
action_27 (29) = happyShift action_19
action_27 (36) = happyShift action_20
action_27 (6) = happyGoto action_52
action_27 (11) = happyGoto action_9
action_27 (13) = happyGoto action_10
action_27 (15) = happyGoto action_11
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (32) = happyShift action_51
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (16) = happyShift action_12
action_29 (17) = happyShift action_13
action_29 (18) = happyShift action_14
action_29 (19) = happyShift action_15
action_29 (21) = happyShift action_16
action_29 (24) = happyShift action_17
action_29 (27) = happyShift action_18
action_29 (29) = happyShift action_19
action_29 (36) = happyShift action_20
action_29 (6) = happyGoto action_24
action_29 (10) = happyGoto action_50
action_29 (11) = happyGoto action_9
action_29 (13) = happyGoto action_10
action_29 (15) = happyGoto action_11
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (16) = happyShift action_12
action_30 (17) = happyShift action_13
action_30 (18) = happyShift action_14
action_30 (19) = happyShift action_15
action_30 (21) = happyShift action_16
action_30 (24) = happyShift action_17
action_30 (27) = happyShift action_18
action_30 (29) = happyShift action_19
action_30 (36) = happyShift action_20
action_30 (6) = happyGoto action_49
action_30 (11) = happyGoto action_9
action_30 (13) = happyGoto action_10
action_30 (15) = happyGoto action_11
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (16) = happyShift action_12
action_31 (17) = happyShift action_13
action_31 (18) = happyShift action_14
action_31 (19) = happyShift action_15
action_31 (21) = happyShift action_16
action_31 (24) = happyShift action_17
action_31 (27) = happyShift action_18
action_31 (29) = happyShift action_19
action_31 (36) = happyShift action_20
action_31 (6) = happyGoto action_48
action_31 (11) = happyGoto action_9
action_31 (13) = happyGoto action_10
action_31 (15) = happyGoto action_11
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (16) = happyShift action_12
action_32 (17) = happyShift action_13
action_32 (18) = happyShift action_14
action_32 (19) = happyShift action_15
action_32 (21) = happyShift action_16
action_32 (24) = happyShift action_17
action_32 (27) = happyShift action_18
action_32 (29) = happyShift action_19
action_32 (36) = happyShift action_20
action_32 (6) = happyGoto action_47
action_32 (11) = happyGoto action_9
action_32 (13) = happyGoto action_10
action_32 (15) = happyGoto action_11
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (16) = happyShift action_12
action_33 (17) = happyShift action_13
action_33 (18) = happyShift action_14
action_33 (19) = happyShift action_15
action_33 (21) = happyShift action_16
action_33 (24) = happyShift action_17
action_33 (27) = happyShift action_18
action_33 (29) = happyShift action_19
action_33 (36) = happyShift action_20
action_33 (6) = happyGoto action_46
action_33 (11) = happyGoto action_9
action_33 (13) = happyGoto action_10
action_33 (15) = happyGoto action_11
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (16) = happyShift action_12
action_34 (17) = happyShift action_13
action_34 (18) = happyShift action_14
action_34 (19) = happyShift action_15
action_34 (21) = happyShift action_16
action_34 (24) = happyShift action_17
action_34 (27) = happyShift action_18
action_34 (29) = happyShift action_19
action_34 (36) = happyShift action_20
action_34 (6) = happyGoto action_45
action_34 (11) = happyGoto action_9
action_34 (13) = happyGoto action_10
action_34 (15) = happyGoto action_11
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_29

action_36 _ = happyReduce_30

action_37 (16) = happyShift action_12
action_37 (17) = happyShift action_13
action_37 (18) = happyShift action_14
action_37 (19) = happyShift action_15
action_37 (21) = happyShift action_16
action_37 (24) = happyShift action_17
action_37 (27) = happyShift action_18
action_37 (29) = happyShift action_19
action_37 (36) = happyShift action_20
action_37 (6) = happyGoto action_44
action_37 (11) = happyGoto action_9
action_37 (13) = happyGoto action_10
action_37 (15) = happyGoto action_11
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (16) = happyShift action_12
action_38 (17) = happyShift action_13
action_38 (18) = happyShift action_14
action_38 (19) = happyShift action_15
action_38 (21) = happyShift action_16
action_38 (24) = happyShift action_17
action_38 (27) = happyShift action_18
action_38 (29) = happyShift action_19
action_38 (36) = happyShift action_20
action_38 (6) = happyGoto action_43
action_38 (11) = happyGoto action_9
action_38 (13) = happyGoto action_10
action_38 (15) = happyGoto action_11
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (32) = happyShift action_42
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (27) = happyShift action_41
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (16) = happyShift action_12
action_41 (17) = happyShift action_13
action_41 (18) = happyShift action_14
action_41 (19) = happyShift action_15
action_41 (21) = happyShift action_16
action_41 (24) = happyShift action_17
action_41 (27) = happyShift action_18
action_41 (29) = happyShift action_19
action_41 (36) = happyShift action_20
action_41 (6) = happyGoto action_24
action_41 (10) = happyGoto action_68
action_41 (11) = happyGoto action_9
action_41 (13) = happyGoto action_10
action_41 (15) = happyGoto action_11
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (16) = happyShift action_12
action_42 (17) = happyShift action_13
action_42 (18) = happyShift action_14
action_42 (19) = happyShift action_15
action_42 (21) = happyShift action_16
action_42 (24) = happyShift action_17
action_42 (27) = happyShift action_18
action_42 (29) = happyShift action_19
action_42 (36) = happyShift action_20
action_42 (6) = happyGoto action_67
action_42 (11) = happyGoto action_9
action_42 (13) = happyGoto action_10
action_42 (15) = happyGoto action_11
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (31) = happyShift action_30
action_43 (33) = happyShift action_31
action_43 (34) = happyShift action_32
action_43 (37) = happyShift action_35
action_43 (38) = happyShift action_36
action_43 _ = happyReduce_25

action_44 (31) = happyShift action_30
action_44 (33) = happyShift action_31
action_44 (34) = happyShift action_32
action_44 (37) = happyShift action_35
action_44 (38) = happyShift action_36
action_44 _ = happyReduce_24

action_45 (31) = happyShift action_30
action_45 (33) = happyShift action_31
action_45 (34) = happyShift action_32
action_45 (37) = happyShift action_35
action_45 (38) = happyShift action_36
action_45 (39) = happyShift action_37
action_45 (40) = happyShift action_38
action_45 _ = happyReduce_23

action_46 (31) = happyShift action_30
action_46 (33) = happyShift action_31
action_46 (34) = happyShift action_32
action_46 (37) = happyShift action_35
action_46 (38) = happyShift action_36
action_46 (39) = happyShift action_37
action_46 (40) = happyShift action_38
action_46 _ = happyReduce_22

action_47 (37) = happyShift action_35
action_47 (38) = happyShift action_36
action_47 _ = happyReduce_26

action_48 (37) = happyShift action_35
action_48 (38) = happyShift action_36
action_48 _ = happyReduce_27

action_49 (37) = happyShift action_35
action_49 (38) = happyShift action_36
action_49 _ = happyReduce_28

action_50 (28) = happyShift action_66
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (16) = happyShift action_12
action_51 (17) = happyShift action_13
action_51 (18) = happyShift action_14
action_51 (19) = happyShift action_15
action_51 (21) = happyShift action_16
action_51 (24) = happyShift action_17
action_51 (27) = happyShift action_18
action_51 (29) = happyShift action_19
action_51 (36) = happyShift action_20
action_51 (6) = happyGoto action_65
action_51 (11) = happyGoto action_9
action_51 (13) = happyGoto action_10
action_51 (15) = happyGoto action_11
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (28) = happyShift action_64
action_52 (31) = happyShift action_30
action_52 (33) = happyShift action_31
action_52 (34) = happyShift action_32
action_52 (35) = happyShift action_33
action_52 (36) = happyShift action_34
action_52 (37) = happyShift action_35
action_52 (38) = happyShift action_36
action_52 (39) = happyShift action_37
action_52 (40) = happyShift action_38
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (27) = happyShift action_63
action_53 (7) = happyGoto action_61
action_53 (8) = happyGoto action_62
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_10

action_55 (16) = happyShift action_12
action_55 (17) = happyShift action_13
action_55 (18) = happyShift action_14
action_55 (19) = happyShift action_15
action_55 (21) = happyShift action_16
action_55 (24) = happyShift action_17
action_55 (27) = happyShift action_18
action_55 (29) = happyShift action_19
action_55 (36) = happyShift action_20
action_55 (6) = happyGoto action_24
action_55 (10) = happyGoto action_60
action_55 (11) = happyGoto action_9
action_55 (13) = happyGoto action_10
action_55 (15) = happyGoto action_11
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_34

action_57 (16) = happyShift action_12
action_57 (17) = happyShift action_13
action_57 (18) = happyShift action_14
action_57 (19) = happyShift action_15
action_57 (21) = happyShift action_16
action_57 (24) = happyShift action_17
action_57 (27) = happyShift action_18
action_57 (29) = happyShift action_19
action_57 (36) = happyShift action_20
action_57 (6) = happyGoto action_58
action_57 (11) = happyGoto action_9
action_57 (13) = happyGoto action_10
action_57 (14) = happyGoto action_59
action_57 (15) = happyGoto action_11
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (31) = happyShift action_30
action_58 (33) = happyShift action_31
action_58 (34) = happyShift action_32
action_58 (35) = happyShift action_33
action_58 (36) = happyShift action_34
action_58 (37) = happyShift action_35
action_58 (38) = happyShift action_36
action_58 (39) = happyShift action_37
action_58 (40) = happyShift action_38
action_58 (41) = happyShift action_57
action_58 _ = happyReduce_35

action_59 _ = happyReduce_36

action_60 _ = happyReduce_21

action_61 _ = happyReduce_11

action_62 (27) = happyShift action_63
action_62 (7) = happyGoto action_76
action_62 (8) = happyGoto action_62
action_62 _ = happyReduce_14

action_63 (16) = happyShift action_74
action_63 (17) = happyShift action_13
action_63 (18) = happyShift action_14
action_63 (26) = happyShift action_75
action_63 (29) = happyShift action_19
action_63 (36) = happyShift action_20
action_63 (9) = happyGoto action_72
action_63 (13) = happyGoto action_73
action_63 (15) = happyGoto action_11
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (22) = happyShift action_71
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (20) = happyShift action_70
action_65 (31) = happyShift action_30
action_65 (33) = happyShift action_31
action_65 (34) = happyShift action_32
action_65 (35) = happyShift action_33
action_65 (36) = happyShift action_34
action_65 (37) = happyShift action_35
action_65 (38) = happyShift action_36
action_65 (39) = happyShift action_37
action_65 (40) = happyShift action_38
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_9

action_67 (31) = happyShift action_30
action_67 (33) = happyShift action_31
action_67 (34) = happyShift action_32
action_67 (35) = happyShift action_33
action_67 (36) = happyShift action_34
action_67 (37) = happyShift action_35
action_67 (38) = happyShift action_36
action_67 (39) = happyShift action_37
action_67 (40) = happyShift action_38
action_67 _ = happyReduce_3

action_68 (28) = happyShift action_69
action_68 _ = happyFail (happyExpListPerState 68)

action_69 _ = happyReduce_4

action_70 (16) = happyShift action_12
action_70 (17) = happyShift action_13
action_70 (18) = happyShift action_14
action_70 (19) = happyShift action_15
action_70 (21) = happyShift action_16
action_70 (24) = happyShift action_17
action_70 (27) = happyShift action_18
action_70 (29) = happyShift action_19
action_70 (36) = happyShift action_20
action_70 (6) = happyGoto action_79
action_70 (11) = happyGoto action_9
action_70 (13) = happyGoto action_10
action_70 (15) = happyGoto action_11
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (16) = happyShift action_12
action_71 (17) = happyShift action_13
action_71 (18) = happyShift action_14
action_71 (19) = happyShift action_15
action_71 (21) = happyShift action_16
action_71 (24) = happyShift action_17
action_71 (27) = happyShift action_18
action_71 (29) = happyShift action_19
action_71 (36) = happyShift action_20
action_71 (6) = happyGoto action_78
action_71 (11) = happyGoto action_9
action_71 (13) = happyGoto action_10
action_71 (15) = happyGoto action_11
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (45) = happyShift action_77
action_72 _ = happyFail (happyExpListPerState 72)

action_73 _ = happyReduce_17

action_74 _ = happyReduce_18

action_75 _ = happyReduce_19

action_76 _ = happyReduce_15

action_77 (16) = happyShift action_12
action_77 (17) = happyShift action_13
action_77 (18) = happyShift action_14
action_77 (19) = happyShift action_15
action_77 (21) = happyShift action_16
action_77 (24) = happyShift action_17
action_77 (27) = happyShift action_18
action_77 (29) = happyShift action_19
action_77 (36) = happyShift action_20
action_77 (6) = happyGoto action_81
action_77 (11) = happyGoto action_9
action_77 (13) = happyGoto action_10
action_77 (15) = happyGoto action_11
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (23) = happyShift action_80
action_78 (31) = happyShift action_30
action_78 (33) = happyShift action_31
action_78 (34) = happyShift action_32
action_78 (35) = happyShift action_33
action_78 (36) = happyShift action_34
action_78 (37) = happyShift action_35
action_78 (38) = happyShift action_36
action_78 (39) = happyShift action_37
action_78 (40) = happyShift action_38
action_78 _ = happyReduce_7

action_79 _ = happyReduce_6

action_80 (16) = happyShift action_12
action_80 (17) = happyShift action_13
action_80 (18) = happyShift action_14
action_80 (19) = happyShift action_15
action_80 (21) = happyShift action_16
action_80 (24) = happyShift action_17
action_80 (27) = happyShift action_18
action_80 (29) = happyShift action_19
action_80 (36) = happyShift action_20
action_80 (6) = happyGoto action_83
action_80 (11) = happyGoto action_9
action_80 (13) = happyGoto action_10
action_80 (15) = happyGoto action_11
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (28) = happyShift action_82
action_81 (31) = happyShift action_30
action_81 (33) = happyShift action_31
action_81 (34) = happyShift action_32
action_81 (35) = happyShift action_33
action_81 (36) = happyShift action_34
action_81 (37) = happyShift action_35
action_81 (38) = happyShift action_36
action_81 (39) = happyShift action_37
action_81 (40) = happyShift action_38
action_81 _ = happyFail (happyExpListPerState 81)

action_82 _ = happyReduce_16

action_83 (31) = happyShift action_30
action_83 (33) = happyShift action_31
action_83 (34) = happyShift action_32
action_83 (35) = happyShift action_33
action_83 (36) = happyShift action_34
action_83 (37) = happyShift action_35
action_83 (38) = happyShift action_36
action_83 (39) = happyShift action_37
action_83 (40) = happyShift action_38
action_83 _ = happyReduce_8

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
	(HappyAbsSyn10  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Name happy_var_2)) `HappyStk`
	(HappyAbsSyn12  happy_var_1) `HappyStk`
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

happyReduce_7 = happyReduce 6 6 happyReduction_7
happyReduction_7 ((HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Langdef.IfThen happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 8 6 happyReduction_8
happyReduction_8 ((HappyAbsSyn6  happy_var_8) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Langdef.IfThenElse happy_var_3 happy_var_6 happy_var_8
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 6 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Langdef.AppFonction happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Langdef.Parenth happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 4 6 happyReduction_11
happyReduction_11 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Langdef.Pattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn6
		 (Langdef.Litteral happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_1  7 happyReduction_14
happyReduction_14 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 ([happy_var_1]
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  7 happyReduction_15
happyReduction_15 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1:happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happyReduce 5 8 happyReduction_16
happyReduction_16 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  9 happyReduction_17
happyReduction_17 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn9
		 (Langdef.PatternLitt happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  9 happyReduction_18
happyReduction_18 (HappyTerminal (Name happy_var_1))
	 =  HappyAbsSyn9
		 (Langdef.PatternName happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_1  9 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn9
		 (Langdef.PatternUniverse
	)

happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 ([happy_var_1]
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  10 happyReduction_21
happyReduction_21 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1:happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  11 happyReduction_22
happyReduction_22 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorBinary Langdef.Plus happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorBinary Langdef.Minus happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  11 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorBinary Langdef.Mult happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  11 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorBinary Langdef.Divide happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  11 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorBinary Langdef.Or happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  11 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorBinary Langdef.And happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  11 happyReduction_28
happyReduction_28 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorBinary Langdef.Equals happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_2  11 happyReduction_29
happyReduction_29 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorUnary Langdef.PlusPlus happy_var_1
	)
happyReduction_29 _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_2  11 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (Langdef.OperatorUnary Langdef.MinusMinus happy_var_1
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  12 happyReduction_31
happyReduction_31 _
	 =  HappyAbsSyn12
		 (Langdef.TypeInt
	)

happyReduce_32 = happySpecReduce_1  12 happyReduction_32
happyReduction_32 _
	 =  HappyAbsSyn12
		 (Langdef.TypeBool
	)

happyReduce_33 = happySpecReduce_1  13 happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  13 happyReduction_34
happyReduction_34 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (Langdef.LTuples happy_var_2
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_3  14 happyReduction_35
happyReduction_35 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn14
		 ([happy_var_1]++[happy_var_3]
	)
happyReduction_35 _ _ _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  14 happyReduction_36
happyReduction_36 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1:happy_var_3
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  15 happyReduction_37
happyReduction_37 (HappyTerminal (Int happy_var_1))
	 =  HappyAbsSyn15
		 (Langdef.LInt happy_var_1
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_2  15 happyReduction_38
happyReduction_38 (HappyTerminal (Int happy_var_2))
	_
	 =  HappyAbsSyn15
		 (Langdef.LInt happy_var_2
	)
happyReduction_38 _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  15 happyReduction_39
happyReduction_39 (HappyTerminal (Bool happy_var_1))
	 =  HappyAbsSyn15
		 (Langdef.LBool happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 46 46 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Name happy_dollar_dollar -> cont 16;
	Int happy_dollar_dollar -> cont 17;
	Bool happy_dollar_dollar -> cont 18;
	Let -> cont 19;
	In -> cont 20;
	If -> cont 21;
	Then -> cont 22;
	Else -> cont 23;
	Case -> cont 24;
	Of -> cont 25;
	Universal -> cont 26;
	LParen -> cont 27;
	RParen -> cont 28;
	LAcol -> cont 29;
	RAcol -> cont 30;
	Equals -> cont 31;
	Eq -> cont 32;
	And -> cont 33;
	Or -> cont 34;
	Plus -> cont 35;
	Minus -> cont 36;
	Plusplus -> cont 37;
	Minusminus -> cont 38;
	Mult -> cont 39;
	Divide -> cont 40;
	Comma -> cont 41;
	Const -> cont 42;
	TInt -> cont 43;
	TBool -> cont 44;
	Arrow -> cont 45;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 46 tk tks = happyError' (tks, explist)
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
