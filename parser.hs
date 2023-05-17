{-# OPTIONS_GHC -w #-}
module Parser  where 
import Lexer
import qualified Langdef
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16
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
	| HappyAbsSyn16 t16

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,319) ([0,10543,7184,0,0,3584,0,0,0,8192,0,0,4096,0,0,0,0,0,0,0,0,0,0,0,0,65152,1,0,0,0,0,0,0,0,0,0,32768,0,0,0,0,0,0,0,0,2,0,0,2048,0,32768,5271,8,49152,2635,4,57344,1317,2,8192,0,0,0,0,0,0,64000,15,0,128,0,0,65152,3,0,8,0,32768,32672,0,9696,517,0,0,16,0,18808,129,0,42172,64,0,21086,32,0,10543,16,32768,5271,8,49152,2635,4,0,0,0,0,0,0,30720,33097,0,48128,16548,0,0,512,0,0,8,0,0,0,12,19392,1034,0,0,3280,0,0,1640,0,0,3892,0,0,1946,0,0,192,0,0,96,0,0,48,0,1024,0,57344,1317,2,0,59648,31,0,64,0,0,0,0,24064,8274,0,0,0,0,38784,2068,0,0,65440,0,0,0,0,0,0,0,0,0,0,8192,0,0,18446,32,0,64,0,0,16392,255,0,0,0,0,53248,63,0,256,0,2048,0,0,0,0,8,0,0,0,12032,4137,0,38784,2068,0,0,0,8,0,0,0,0,0,0,0,0,0,0,0,0,21086,32,0,0,0,0,0,0,0,0,1536,0,0,0,61440,658,1,0,62592,15,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","Spec","Decl","Expr","Param","Patterns","Pattern","PatValue","Arg","Op","Type","Lit","Tuples","Factor","name","int","bool","let","in","if","then","else","case","of","'_'","'('","')'","'{'","'}'","'=='","'='","'&&'","'||'","'+'","'-'","'++'","'--'","'*'","'/'","','","'const'","'int'","'bool'","'->'","%eof"]
        bit_start = st Prelude.* 47
        bit_end = (st Prelude.+ 1) Prelude.* 47
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..46]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (17) = happyShift action_12
action_0 (18) = happyShift action_13
action_0 (19) = happyShift action_14
action_0 (20) = happyShift action_15
action_0 (22) = happyShift action_16
action_0 (25) = happyShift action_17
action_0 (28) = happyShift action_18
action_0 (30) = happyShift action_19
action_0 (37) = happyShift action_20
action_0 (43) = happyShift action_4
action_0 (44) = happyShift action_5
action_0 (45) = happyShift action_6
action_0 (4) = happyGoto action_7
action_0 (5) = happyGoto action_2
action_0 (6) = happyGoto action_8
action_0 (12) = happyGoto action_9
action_0 (13) = happyGoto action_3
action_0 (14) = happyGoto action_10
action_0 (16) = happyGoto action_11
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (43) = happyShift action_4
action_1 (44) = happyShift action_5
action_1 (45) = happyShift action_6
action_1 (5) = happyGoto action_2
action_1 (13) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 _ = happyReduce_1

action_3 (17) = happyShift action_40
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (17) = happyShift action_39
action_4 _ = happyFail (happyExpListPerState 4)

action_5 _ = happyReduce_33

action_6 _ = happyReduce_34

action_7 (47) = happyAccept
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (32) = happyShift action_30
action_8 (34) = happyShift action_31
action_8 (35) = happyShift action_32
action_8 (36) = happyShift action_33
action_8 (37) = happyShift action_34
action_8 (38) = happyShift action_35
action_8 (39) = happyShift action_36
action_8 (40) = happyShift action_37
action_8 (41) = happyShift action_38
action_8 _ = happyReduce_2

action_9 _ = happyReduce_12

action_10 _ = happyReduce_13

action_11 _ = happyReduce_35

action_12 (28) = happyShift action_29
action_12 _ = happyReduce_5

action_13 _ = happyReduce_39

action_14 _ = happyReduce_41

action_15 (17) = happyShift action_28
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (28) = happyShift action_27
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (17) = happyShift action_12
action_17 (18) = happyShift action_13
action_17 (19) = happyShift action_14
action_17 (20) = happyShift action_15
action_17 (22) = happyShift action_16
action_17 (25) = happyShift action_17
action_17 (28) = happyShift action_18
action_17 (30) = happyShift action_19
action_17 (37) = happyShift action_20
action_17 (6) = happyGoto action_26
action_17 (12) = happyGoto action_9
action_17 (14) = happyGoto action_10
action_17 (16) = happyGoto action_11
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (17) = happyShift action_12
action_18 (18) = happyShift action_13
action_18 (19) = happyShift action_14
action_18 (20) = happyShift action_15
action_18 (22) = happyShift action_16
action_18 (25) = happyShift action_17
action_18 (28) = happyShift action_18
action_18 (30) = happyShift action_19
action_18 (37) = happyShift action_20
action_18 (6) = happyGoto action_24
action_18 (11) = happyGoto action_25
action_18 (12) = happyGoto action_9
action_18 (14) = happyGoto action_10
action_18 (16) = happyGoto action_11
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (17) = happyShift action_12
action_19 (18) = happyShift action_13
action_19 (19) = happyShift action_14
action_19 (20) = happyShift action_15
action_19 (22) = happyShift action_16
action_19 (25) = happyShift action_17
action_19 (28) = happyShift action_18
action_19 (30) = happyShift action_19
action_19 (37) = happyShift action_20
action_19 (6) = happyGoto action_22
action_19 (12) = happyGoto action_9
action_19 (14) = happyGoto action_10
action_19 (15) = happyGoto action_23
action_19 (16) = happyGoto action_11
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (18) = happyShift action_21
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_40

action_22 (32) = happyShift action_30
action_22 (34) = happyShift action_31
action_22 (35) = happyShift action_32
action_22 (36) = happyShift action_33
action_22 (37) = happyShift action_34
action_22 (38) = happyShift action_35
action_22 (39) = happyShift action_36
action_22 (40) = happyShift action_37
action_22 (41) = happyShift action_38
action_22 (42) = happyShift action_57
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (31) = happyShift action_56
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (32) = happyShift action_30
action_24 (34) = happyShift action_31
action_24 (35) = happyShift action_32
action_24 (36) = happyShift action_33
action_24 (37) = happyShift action_34
action_24 (38) = happyShift action_35
action_24 (39) = happyShift action_36
action_24 (40) = happyShift action_37
action_24 (41) = happyShift action_38
action_24 (42) = happyShift action_55
action_24 _ = happyReduce_22

action_25 (29) = happyShift action_54
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (26) = happyShift action_53
action_26 (32) = happyShift action_30
action_26 (34) = happyShift action_31
action_26 (35) = happyShift action_32
action_26 (36) = happyShift action_33
action_26 (37) = happyShift action_34
action_26 (38) = happyShift action_35
action_26 (39) = happyShift action_36
action_26 (40) = happyShift action_37
action_26 (41) = happyShift action_38
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (17) = happyShift action_12
action_27 (18) = happyShift action_13
action_27 (19) = happyShift action_14
action_27 (20) = happyShift action_15
action_27 (22) = happyShift action_16
action_27 (25) = happyShift action_17
action_27 (28) = happyShift action_18
action_27 (30) = happyShift action_19
action_27 (37) = happyShift action_20
action_27 (6) = happyGoto action_52
action_27 (12) = happyGoto action_9
action_27 (14) = happyGoto action_10
action_27 (16) = happyGoto action_11
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (33) = happyShift action_51
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (17) = happyShift action_12
action_29 (18) = happyShift action_13
action_29 (19) = happyShift action_14
action_29 (20) = happyShift action_15
action_29 (22) = happyShift action_16
action_29 (25) = happyShift action_17
action_29 (28) = happyShift action_18
action_29 (30) = happyShift action_19
action_29 (37) = happyShift action_20
action_29 (6) = happyGoto action_24
action_29 (11) = happyGoto action_50
action_29 (12) = happyGoto action_9
action_29 (14) = happyGoto action_10
action_29 (16) = happyGoto action_11
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (17) = happyShift action_12
action_30 (18) = happyShift action_13
action_30 (19) = happyShift action_14
action_30 (20) = happyShift action_15
action_30 (22) = happyShift action_16
action_30 (25) = happyShift action_17
action_30 (28) = happyShift action_18
action_30 (30) = happyShift action_19
action_30 (37) = happyShift action_20
action_30 (6) = happyGoto action_49
action_30 (12) = happyGoto action_9
action_30 (14) = happyGoto action_10
action_30 (16) = happyGoto action_11
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (17) = happyShift action_12
action_31 (18) = happyShift action_13
action_31 (19) = happyShift action_14
action_31 (20) = happyShift action_15
action_31 (22) = happyShift action_16
action_31 (25) = happyShift action_17
action_31 (28) = happyShift action_18
action_31 (30) = happyShift action_19
action_31 (37) = happyShift action_20
action_31 (6) = happyGoto action_48
action_31 (12) = happyGoto action_9
action_31 (14) = happyGoto action_10
action_31 (16) = happyGoto action_11
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (17) = happyShift action_12
action_32 (18) = happyShift action_13
action_32 (19) = happyShift action_14
action_32 (20) = happyShift action_15
action_32 (22) = happyShift action_16
action_32 (25) = happyShift action_17
action_32 (28) = happyShift action_18
action_32 (30) = happyShift action_19
action_32 (37) = happyShift action_20
action_32 (6) = happyGoto action_47
action_32 (12) = happyGoto action_9
action_32 (14) = happyGoto action_10
action_32 (16) = happyGoto action_11
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (17) = happyShift action_12
action_33 (18) = happyShift action_13
action_33 (19) = happyShift action_14
action_33 (20) = happyShift action_15
action_33 (22) = happyShift action_16
action_33 (25) = happyShift action_17
action_33 (28) = happyShift action_18
action_33 (30) = happyShift action_19
action_33 (37) = happyShift action_20
action_33 (6) = happyGoto action_46
action_33 (12) = happyGoto action_9
action_33 (14) = happyGoto action_10
action_33 (16) = happyGoto action_11
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (17) = happyShift action_12
action_34 (18) = happyShift action_13
action_34 (19) = happyShift action_14
action_34 (20) = happyShift action_15
action_34 (22) = happyShift action_16
action_34 (25) = happyShift action_17
action_34 (28) = happyShift action_18
action_34 (30) = happyShift action_19
action_34 (37) = happyShift action_20
action_34 (6) = happyGoto action_45
action_34 (12) = happyGoto action_9
action_34 (14) = happyGoto action_10
action_34 (16) = happyGoto action_11
action_34 _ = happyFail (happyExpListPerState 34)

action_35 _ = happyReduce_31

action_36 _ = happyReduce_32

action_37 (17) = happyShift action_12
action_37 (18) = happyShift action_13
action_37 (19) = happyShift action_14
action_37 (20) = happyShift action_15
action_37 (22) = happyShift action_16
action_37 (25) = happyShift action_17
action_37 (28) = happyShift action_18
action_37 (30) = happyShift action_19
action_37 (37) = happyShift action_20
action_37 (6) = happyGoto action_44
action_37 (12) = happyGoto action_9
action_37 (14) = happyGoto action_10
action_37 (16) = happyGoto action_11
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (17) = happyShift action_12
action_38 (18) = happyShift action_13
action_38 (19) = happyShift action_14
action_38 (20) = happyShift action_15
action_38 (22) = happyShift action_16
action_38 (25) = happyShift action_17
action_38 (28) = happyShift action_18
action_38 (30) = happyShift action_19
action_38 (37) = happyShift action_20
action_38 (6) = happyGoto action_43
action_38 (12) = happyGoto action_9
action_38 (14) = happyGoto action_10
action_38 (16) = happyGoto action_11
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (33) = happyShift action_42
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (28) = happyShift action_41
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (44) = happyShift action_5
action_41 (45) = happyShift action_6
action_41 (7) = happyGoto action_68
action_41 (13) = happyGoto action_69
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (17) = happyShift action_12
action_42 (18) = happyShift action_13
action_42 (19) = happyShift action_14
action_42 (20) = happyShift action_15
action_42 (22) = happyShift action_16
action_42 (25) = happyShift action_17
action_42 (28) = happyShift action_18
action_42 (30) = happyShift action_19
action_42 (37) = happyShift action_20
action_42 (6) = happyGoto action_67
action_42 (12) = happyGoto action_9
action_42 (14) = happyGoto action_10
action_42 (16) = happyGoto action_11
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (32) = happyShift action_30
action_43 (34) = happyShift action_31
action_43 (35) = happyShift action_32
action_43 (38) = happyShift action_35
action_43 (39) = happyShift action_36
action_43 _ = happyReduce_27

action_44 (32) = happyShift action_30
action_44 (34) = happyShift action_31
action_44 (35) = happyShift action_32
action_44 (38) = happyShift action_35
action_44 (39) = happyShift action_36
action_44 _ = happyReduce_26

action_45 (32) = happyShift action_30
action_45 (34) = happyShift action_31
action_45 (35) = happyShift action_32
action_45 (38) = happyShift action_35
action_45 (39) = happyShift action_36
action_45 (40) = happyShift action_37
action_45 (41) = happyShift action_38
action_45 _ = happyReduce_25

action_46 (32) = happyShift action_30
action_46 (34) = happyShift action_31
action_46 (35) = happyShift action_32
action_46 (38) = happyShift action_35
action_46 (39) = happyShift action_36
action_46 (40) = happyShift action_37
action_46 (41) = happyShift action_38
action_46 _ = happyReduce_24

action_47 (38) = happyShift action_35
action_47 (39) = happyShift action_36
action_47 _ = happyReduce_28

action_48 (38) = happyShift action_35
action_48 (39) = happyShift action_36
action_48 _ = happyReduce_29

action_49 (38) = happyShift action_35
action_49 (39) = happyShift action_36
action_49 _ = happyReduce_30

action_50 (29) = happyShift action_66
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (17) = happyShift action_12
action_51 (18) = happyShift action_13
action_51 (19) = happyShift action_14
action_51 (20) = happyShift action_15
action_51 (22) = happyShift action_16
action_51 (25) = happyShift action_17
action_51 (28) = happyShift action_18
action_51 (30) = happyShift action_19
action_51 (37) = happyShift action_20
action_51 (6) = happyGoto action_65
action_51 (12) = happyGoto action_9
action_51 (14) = happyGoto action_10
action_51 (16) = happyGoto action_11
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (29) = happyShift action_64
action_52 (32) = happyShift action_30
action_52 (34) = happyShift action_31
action_52 (35) = happyShift action_32
action_52 (36) = happyShift action_33
action_52 (37) = happyShift action_34
action_52 (38) = happyShift action_35
action_52 (39) = happyShift action_36
action_52 (40) = happyShift action_37
action_52 (41) = happyShift action_38
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (28) = happyShift action_63
action_53 (8) = happyGoto action_61
action_53 (9) = happyGoto action_62
action_53 _ = happyFail (happyExpListPerState 53)

action_54 _ = happyReduce_10

action_55 (17) = happyShift action_12
action_55 (18) = happyShift action_13
action_55 (19) = happyShift action_14
action_55 (20) = happyShift action_15
action_55 (22) = happyShift action_16
action_55 (25) = happyShift action_17
action_55 (28) = happyShift action_18
action_55 (30) = happyShift action_19
action_55 (37) = happyShift action_20
action_55 (6) = happyGoto action_24
action_55 (11) = happyGoto action_60
action_55 (12) = happyGoto action_9
action_55 (14) = happyGoto action_10
action_55 (16) = happyGoto action_11
action_55 _ = happyFail (happyExpListPerState 55)

action_56 _ = happyReduce_36

action_57 (17) = happyShift action_12
action_57 (18) = happyShift action_13
action_57 (19) = happyShift action_14
action_57 (20) = happyShift action_15
action_57 (22) = happyShift action_16
action_57 (25) = happyShift action_17
action_57 (28) = happyShift action_18
action_57 (30) = happyShift action_19
action_57 (37) = happyShift action_20
action_57 (6) = happyGoto action_58
action_57 (12) = happyGoto action_9
action_57 (14) = happyGoto action_10
action_57 (15) = happyGoto action_59
action_57 (16) = happyGoto action_11
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (32) = happyShift action_30
action_58 (34) = happyShift action_31
action_58 (35) = happyShift action_32
action_58 (36) = happyShift action_33
action_58 (37) = happyShift action_34
action_58 (38) = happyShift action_35
action_58 (39) = happyShift action_36
action_58 (40) = happyShift action_37
action_58 (41) = happyShift action_38
action_58 (42) = happyShift action_57
action_58 _ = happyReduce_37

action_59 _ = happyReduce_38

action_60 _ = happyReduce_23

action_61 _ = happyReduce_11

action_62 (28) = happyShift action_63
action_62 (8) = happyGoto action_78
action_62 (9) = happyGoto action_62
action_62 _ = happyReduce_16

action_63 (17) = happyShift action_76
action_63 (18) = happyShift action_13
action_63 (19) = happyShift action_14
action_63 (27) = happyShift action_77
action_63 (30) = happyShift action_19
action_63 (37) = happyShift action_20
action_63 (10) = happyGoto action_74
action_63 (14) = happyGoto action_75
action_63 (16) = happyGoto action_11
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (23) = happyShift action_73
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (21) = happyShift action_72
action_65 (32) = happyShift action_30
action_65 (34) = happyShift action_31
action_65 (35) = happyShift action_32
action_65 (36) = happyShift action_33
action_65 (37) = happyShift action_34
action_65 (38) = happyShift action_35
action_65 (39) = happyShift action_36
action_65 (40) = happyShift action_37
action_65 (41) = happyShift action_38
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_9

action_67 (32) = happyShift action_30
action_67 (34) = happyShift action_31
action_67 (35) = happyShift action_32
action_67 (36) = happyShift action_33
action_67 (37) = happyShift action_34
action_67 (38) = happyShift action_35
action_67 (39) = happyShift action_36
action_67 (40) = happyShift action_37
action_67 (41) = happyShift action_38
action_67 _ = happyReduce_3

action_68 (29) = happyShift action_71
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (17) = happyShift action_70
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (42) = happyShift action_82
action_70 _ = happyReduce_14

action_71 _ = happyReduce_4

action_72 (17) = happyShift action_12
action_72 (18) = happyShift action_13
action_72 (19) = happyShift action_14
action_72 (20) = happyShift action_15
action_72 (22) = happyShift action_16
action_72 (25) = happyShift action_17
action_72 (28) = happyShift action_18
action_72 (30) = happyShift action_19
action_72 (37) = happyShift action_20
action_72 (6) = happyGoto action_81
action_72 (12) = happyGoto action_9
action_72 (14) = happyGoto action_10
action_72 (16) = happyGoto action_11
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (17) = happyShift action_12
action_73 (18) = happyShift action_13
action_73 (19) = happyShift action_14
action_73 (20) = happyShift action_15
action_73 (22) = happyShift action_16
action_73 (25) = happyShift action_17
action_73 (28) = happyShift action_18
action_73 (30) = happyShift action_19
action_73 (37) = happyShift action_20
action_73 (6) = happyGoto action_80
action_73 (12) = happyGoto action_9
action_73 (14) = happyGoto action_10
action_73 (16) = happyGoto action_11
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (46) = happyShift action_79
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_19

action_76 _ = happyReduce_20

action_77 _ = happyReduce_21

action_78 _ = happyReduce_17

action_79 (17) = happyShift action_12
action_79 (18) = happyShift action_13
action_79 (19) = happyShift action_14
action_79 (20) = happyShift action_15
action_79 (22) = happyShift action_16
action_79 (25) = happyShift action_17
action_79 (28) = happyShift action_18
action_79 (30) = happyShift action_19
action_79 (37) = happyShift action_20
action_79 (6) = happyGoto action_85
action_79 (12) = happyGoto action_9
action_79 (14) = happyGoto action_10
action_79 (16) = happyGoto action_11
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (24) = happyShift action_84
action_80 (32) = happyShift action_30
action_80 (34) = happyShift action_31
action_80 (35) = happyShift action_32
action_80 (36) = happyShift action_33
action_80 (37) = happyShift action_34
action_80 (38) = happyShift action_35
action_80 (39) = happyShift action_36
action_80 (40) = happyShift action_37
action_80 (41) = happyShift action_38
action_80 _ = happyReduce_7

action_81 _ = happyReduce_6

action_82 (44) = happyShift action_5
action_82 (45) = happyShift action_6
action_82 (7) = happyGoto action_83
action_82 (13) = happyGoto action_69
action_82 _ = happyFail (happyExpListPerState 82)

action_83 _ = happyReduce_15

action_84 (17) = happyShift action_12
action_84 (18) = happyShift action_13
action_84 (19) = happyShift action_14
action_84 (20) = happyShift action_15
action_84 (22) = happyShift action_16
action_84 (25) = happyShift action_17
action_84 (28) = happyShift action_18
action_84 (30) = happyShift action_19
action_84 (37) = happyShift action_20
action_84 (6) = happyGoto action_87
action_84 (12) = happyGoto action_9
action_84 (14) = happyGoto action_10
action_84 (16) = happyGoto action_11
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (29) = happyShift action_86
action_85 (32) = happyShift action_30
action_85 (34) = happyShift action_31
action_85 (35) = happyShift action_32
action_85 (36) = happyShift action_33
action_85 (37) = happyShift action_34
action_85 (38) = happyShift action_35
action_85 (39) = happyShift action_36
action_85 (40) = happyShift action_37
action_85 (41) = happyShift action_38
action_85 _ = happyFail (happyExpListPerState 85)

action_86 _ = happyReduce_18

action_87 (32) = happyShift action_30
action_87 (34) = happyShift action_31
action_87 (35) = happyShift action_32
action_87 (36) = happyShift action_33
action_87 (37) = happyShift action_34
action_87 (38) = happyShift action_35
action_87 (39) = happyShift action_36
action_87 (40) = happyShift action_37
action_87 (41) = happyShift action_38
action_87 _ = happyReduce_8

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
	(HappyAbsSyn13  happy_var_1) `HappyStk`
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
	(HappyAbsSyn11  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Name happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Langdef.AppFonction happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn11  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Langdef.Parenth happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 4 6 happyReduction_11
happyReduction_11 ((HappyAbsSyn8  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Langdef.Pattern happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  6 happyReduction_12
happyReduction_12 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  6 happyReduction_13
happyReduction_13 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn6
		 (Langdef.Litteral happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_2  7 happyReduction_14
happyReduction_14 (HappyTerminal (Name happy_var_2))
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn7
		 ([(happy_var_1, happy_var_2)]
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 7 happyReduction_15
happyReduction_15 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (Name happy_var_2)) `HappyStk`
	(HappyAbsSyn13  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 ((happy_var_1, happy_var_2):happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_2  8 happyReduction_17
happyReduction_17 (HappyAbsSyn8  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1:happy_var_2
	)
happyReduction_17 _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 5 9 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 ((happy_var_2, happy_var_4)
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  10 happyReduction_19
happyReduction_19 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn10
		 (Langdef.PatternLitt happy_var_1
	)
happyReduction_19 _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  10 happyReduction_20
happyReduction_20 (HappyTerminal (Name happy_var_1))
	 =  HappyAbsSyn10
		 (Langdef.PatternName happy_var_1
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  10 happyReduction_21
happyReduction_21 _
	 =  HappyAbsSyn10
		 (Langdef.PatternUniverse
	)

happyReduce_22 = happySpecReduce_1  11 happyReduction_22
happyReduction_22 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 ([happy_var_1]
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  11 happyReduction_23
happyReduction_23 (HappyAbsSyn11  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1:happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  12 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorBinary Langdef.Plus happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  12 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorBinary Langdef.Minus happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  12 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorBinary Langdef.Mult happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  12 happyReduction_27
happyReduction_27 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorBinary Langdef.Divide happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  12 happyReduction_28
happyReduction_28 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorBinary Langdef.Or happy_var_1 happy_var_3
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_3  12 happyReduction_29
happyReduction_29 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorBinary Langdef.And happy_var_1 happy_var_3
	)
happyReduction_29 _ _ _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  12 happyReduction_30
happyReduction_30 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorBinary Langdef.Equals happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_2  12 happyReduction_31
happyReduction_31 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorUnary Langdef.PlusPlus happy_var_1
	)
happyReduction_31 _ _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_2  12 happyReduction_32
happyReduction_32 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn12
		 (Langdef.OperatorUnary Langdef.MinusMinus happy_var_1
	)
happyReduction_32 _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  13 happyReduction_33
happyReduction_33 _
	 =  HappyAbsSyn13
		 (Langdef.TypeInt
	)

happyReduce_34 = happySpecReduce_1  13 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn13
		 (Langdef.TypeBool
	)

happyReduce_35 = happySpecReduce_1  14 happyReduction_35
happyReduction_35 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_35 _  = notHappyAtAll 

happyReduce_36 = happySpecReduce_3  14 happyReduction_36
happyReduction_36 _
	(HappyAbsSyn15  happy_var_2)
	_
	 =  HappyAbsSyn14
		 (Langdef.LTuples happy_var_2
	)
happyReduction_36 _ _ _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_3  15 happyReduction_37
happyReduction_37 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn15
		 ([happy_var_1]++[happy_var_3]
	)
happyReduction_37 _ _ _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_3  15 happyReduction_38
happyReduction_38 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn15
		 (happy_var_1:happy_var_3
	)
happyReduction_38 _ _ _  = notHappyAtAll 

happyReduce_39 = happySpecReduce_1  16 happyReduction_39
happyReduction_39 (HappyTerminal (Int happy_var_1))
	 =  HappyAbsSyn16
		 (Langdef.LInt happy_var_1
	)
happyReduction_39 _  = notHappyAtAll 

happyReduce_40 = happySpecReduce_2  16 happyReduction_40
happyReduction_40 (HappyTerminal (Int happy_var_2))
	_
	 =  HappyAbsSyn16
		 (Langdef.LInt happy_var_2
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  16 happyReduction_41
happyReduction_41 (HappyTerminal (Bool happy_var_1))
	 =  HappyAbsSyn16
		 (Langdef.LBool happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 47 47 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Name happy_dollar_dollar -> cont 17;
	Int happy_dollar_dollar -> cont 18;
	Bool happy_dollar_dollar -> cont 19;
	Let -> cont 20;
	In -> cont 21;
	If -> cont 22;
	Then -> cont 23;
	Else -> cont 24;
	Case -> cont 25;
	Of -> cont 26;
	Universal -> cont 27;
	LParen -> cont 28;
	RParen -> cont 29;
	LAcol -> cont 30;
	RAcol -> cont 31;
	Equals -> cont 32;
	Eq -> cont 33;
	And -> cont 34;
	Or -> cont 35;
	Plus -> cont 36;
	Minus -> cont 37;
	Plusplus -> cont 38;
	Minusminus -> cont 39;
	Mult -> cont 40;
	Divide -> cont 41;
	Comma -> cont 42;
	Const -> cont 43;
	TInt -> cont 44;
	TBool -> cont 45;
	Arrow -> cont 46;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 47 tk tks = happyError' (tks, explist)
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
