{-# OPTIONS_GHC -fno-warn-unused-binds -fno-warn-missing-signatures #-}
{-# LANGUAGE CPP #-}
{-# LINE 1 "lexer.x" #-}
module Lexer (lexer, Token(..)) where
#if __GLASGOW_HASKELL__ >= 603
#include "ghcconfig.h"
#elif defined(__GLASGOW_HASKELL__)
#include "config.h"
#endif
#if __GLASGOW_HASKELL__ >= 503
import Data.Array
#else
import Array
#endif
#define ALEX_BASIC 1
-- -----------------------------------------------------------------------------
-- Alex wrapper code.
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.

#if defined(ALEX_MONAD) || defined(ALEX_MONAD_BYTESTRING)
import Control.Applicative as App (Applicative (..))
#endif

import Data.Word (Word8)
#if defined(ALEX_BASIC_BYTESTRING) || defined(ALEX_POSN_BYTESTRING) || defined(ALEX_MONAD_BYTESTRING)

import Data.Int (Int64)
import qualified Data.Char
import qualified Data.ByteString.Lazy     as ByteString
import qualified Data.ByteString.Internal as ByteString (w2c)

#elif defined(ALEX_STRICT_BYTESTRING)

import qualified Data.Char
import qualified Data.ByteString          as ByteString
import qualified Data.ByteString.Internal as ByteString hiding (ByteString)
import qualified Data.ByteString.Unsafe   as ByteString

#else

import Data.Char (ord)
import qualified Data.Bits

-- | Encode a Haskell String to a list of Word8 values, in UTF8 format.
utf8Encode :: Char -> [Word8]
utf8Encode = uncurry (:) . utf8Encode'

utf8Encode' :: Char -> (Word8, [Word8])
utf8Encode' c = case go (ord c) of
                  (x, xs) -> (fromIntegral x, map fromIntegral xs)
 where
  go oc
   | oc <= 0x7f       = ( oc
                        , [
                        ])

   | oc <= 0x7ff      = ( 0xc0 + (oc `Data.Bits.shiftR` 6)
                        , [0x80 + oc Data.Bits..&. 0x3f
                        ])

   | oc <= 0xffff     = ( 0xe0 + (oc `Data.Bits.shiftR` 12)
                        , [0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ])
   | otherwise        = ( 0xf0 + (oc `Data.Bits.shiftR` 18)
                        , [0x80 + ((oc `Data.Bits.shiftR` 12) Data.Bits..&. 0x3f)
                        , 0x80 + ((oc `Data.Bits.shiftR` 6) Data.Bits..&. 0x3f)
                        , 0x80 + oc Data.Bits..&. 0x3f
                        ])

#endif

type Byte = Word8

-- -----------------------------------------------------------------------------
-- The input type

#if defined(ALEX_POSN) || defined(ALEX_MONAD) || defined(ALEX_GSCAN)
type AlexInput = (AlexPosn,     -- current position,
                  Char,         -- previous char
                  [Byte],       -- pending bytes on current char
                  String)       -- current input string

ignorePendingBytes :: AlexInput -> AlexInput
ignorePendingBytes (p,c,_ps,s) = (p,c,[],s)

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (_p,c,_bs,_s) = c

alexGetByte :: AlexInput -> Maybe (Byte,AlexInput)
alexGetByte (p,c,(b:bs),s) = Just (b,(p,c,bs,s))
alexGetByte (_,_,[],[]) = Nothing
alexGetByte (p,_,[],(c:s))  = let p' = alexMove p c
                              in case utf8Encode' c of
                                   (b, bs) -> p' `seq`  Just (b, (p', c, bs, s))
#endif

#if defined(ALEX_POSN_BYTESTRING) || defined(ALEX_MONAD_BYTESTRING)
type AlexInput = (AlexPosn,     -- current position,
                  Char,         -- previous char
                  ByteString.ByteString,        -- current input string
                  Int64)           -- bytes consumed so far

ignorePendingBytes :: AlexInput -> AlexInput
ignorePendingBytes i = i   -- no pending bytes when lexing bytestrings

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (_,c,_,_) = c

alexGetByte :: AlexInput -> Maybe (Byte,AlexInput)
alexGetByte (p,_,cs,n) =
    case ByteString.uncons cs of
        Nothing -> Nothing
        Just (b, cs') ->
            let c   = ByteString.w2c b
                p'  = alexMove p c
                n'  = n+1
            in p' `seq` cs' `seq` n' `seq` Just (b, (p', c, cs',n'))
#endif

#ifdef ALEX_BASIC_BYTESTRING
data AlexInput = AlexInput { alexChar :: {-# UNPACK #-} !Char,      -- previous char
                             alexStr ::  !ByteString.ByteString,    -- current input string
                             alexBytePos :: {-# UNPACK #-} !Int64}  -- bytes consumed so far

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar = alexChar

alexGetByte (AlexInput {alexStr=cs,alexBytePos=n}) =
    case ByteString.uncons cs of
        Nothing -> Nothing
        Just (c, rest) ->
            Just (c, AlexInput {
                alexChar = ByteString.w2c c,
                alexStr =  rest,
                alexBytePos = n+1})
#endif

#ifdef ALEX_STRICT_BYTESTRING
data AlexInput = AlexInput { alexChar :: {-# UNPACK #-} !Char,
                             alexStr :: {-# UNPACK #-} !ByteString.ByteString,
                             alexBytePos :: {-# UNPACK #-} !Int}

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar = alexChar

alexGetByte (AlexInput {alexStr=cs,alexBytePos=n}) =
    case ByteString.uncons cs of
        Nothing -> Nothing
        Just (c, rest) ->
            Just (c, AlexInput {
                alexChar = ByteString.w2c c,
                alexStr =  rest,
                alexBytePos = n+1})
#endif

-- -----------------------------------------------------------------------------
-- Token positions

-- `Posn' records the location of a token in the input text.  It has three
-- fields: the address (number of characters preceding the token), line number
-- and column of a token within the file. `start_pos' gives the position of the
-- start of the file and `eof_pos' a standard encoding for the end of file.
-- `move_pos' calculates the new position after traversing a given character,
-- assuming the usual eight character tab stops.

#if defined(ALEX_POSN) || defined(ALEX_MONAD) || defined(ALEX_POSN_BYTESTRING) || defined(ALEX_MONAD_BYTESTRING) || defined(ALEX_GSCAN)
data AlexPosn = AlexPn !Int !Int !Int
        deriving (Eq,Show)

alexStartPos :: AlexPosn
alexStartPos = AlexPn 0 1 1

alexMove :: AlexPosn -> Char -> AlexPosn
alexMove (AlexPn a l c) '\t' = AlexPn (a+1)  l     (c+alex_tab_size-((c-1) `mod` alex_tab_size))
alexMove (AlexPn a l _) '\n' = AlexPn (a+1) (l+1)   1
alexMove (AlexPn a l c) _    = AlexPn (a+1)  l     (c+1)
#endif

-- -----------------------------------------------------------------------------
-- Monad (default and with ByteString input)

#if defined(ALEX_MONAD) || defined(ALEX_MONAD_BYTESTRING)
data AlexState = AlexState {
        alex_pos :: !AlexPosn,  -- position at current input location
#ifndef ALEX_MONAD_BYTESTRING
        alex_inp :: String,     -- the current input
        alex_chr :: !Char,      -- the character before the input
        alex_bytes :: [Byte],
#else /* ALEX_MONAD_BYTESTRING */
        alex_bpos:: !Int64,     -- bytes consumed so far
        alex_inp :: ByteString.ByteString,      -- the current input
        alex_chr :: !Char,      -- the character before the input
#endif /* ALEX_MONAD_BYTESTRING */
        alex_scd :: !Int        -- the current startcode
#ifdef ALEX_MONAD_USER_STATE
      , alex_ust :: AlexUserState -- AlexUserState will be defined in the user program
#endif
    }

-- Compile with -funbox-strict-fields for best results!

#ifndef ALEX_MONAD_BYTESTRING
runAlex :: String -> Alex a -> Either String a
runAlex input__ (Alex f)
   = case f (AlexState {alex_bytes = [],
#else /* ALEX_MONAD_BYTESTRING */
runAlex :: ByteString.ByteString -> Alex a -> Either String a
runAlex input__ (Alex f)
   = case f (AlexState {alex_bpos = 0,
#endif /* ALEX_MONAD_BYTESTRING */
                        alex_pos = alexStartPos,
                        alex_inp = input__,
                        alex_chr = '\n',
#ifdef ALEX_MONAD_USER_STATE
                        alex_ust = alexInitUserState,
#endif
                        alex_scd = 0}) of Left msg -> Left msg
                                          Right ( _, a ) -> Right a

newtype Alex a = Alex { unAlex :: AlexState -> Either String (AlexState, a) }

instance Functor Alex where
  fmap f a = Alex $ \s -> case unAlex a s of
                            Left msg -> Left msg
                            Right (s', a') -> Right (s', f a')

instance Applicative Alex where
  pure a   = Alex $ \s -> Right (s, a)
  fa <*> a = Alex $ \s -> case unAlex fa s of
                            Left msg -> Left msg
                            Right (s', f) -> case unAlex a s' of
                                               Left msg -> Left msg
                                               Right (s'', b) -> Right (s'', f b)

instance Monad Alex where
  m >>= k  = Alex $ \s -> case unAlex m s of
                                Left msg -> Left msg
                                Right (s',a) -> unAlex (k a) s'
  return = App.pure

alexGetInput :: Alex AlexInput
alexGetInput
#ifndef ALEX_MONAD_BYTESTRING
 = Alex $ \s@AlexState{alex_pos=pos,alex_chr=c,alex_bytes=bs,alex_inp=inp__} ->
        Right (s, (pos,c,bs,inp__))
#else /* ALEX_MONAD_BYTESTRING */
 = Alex $ \s@AlexState{alex_pos=pos,alex_bpos=bpos,alex_chr=c,alex_inp=inp__} ->
        Right (s, (pos,c,inp__,bpos))
#endif /* ALEX_MONAD_BYTESTRING */

alexSetInput :: AlexInput -> Alex ()
#ifndef ALEX_MONAD_BYTESTRING
alexSetInput (pos,c,bs,inp__)
 = Alex $ \s -> case s{alex_pos=pos,alex_chr=c,alex_bytes=bs,alex_inp=inp__} of
#else /* ALEX_MONAD_BYTESTRING */
alexSetInput (pos,c,inp__,bpos)
 = Alex $ \s -> case s{alex_pos=pos,
                       alex_bpos=bpos,
                       alex_chr=c,
                       alex_inp=inp__} of
#endif /* ALEX_MONAD_BYTESTRING */
                  state__@(AlexState{}) -> Right (state__, ())

alexError :: String -> Alex a
alexError message = Alex $ const $ Left message

alexGetStartCode :: Alex Int
alexGetStartCode = Alex $ \s@AlexState{alex_scd=sc} -> Right (s, sc)

alexSetStartCode :: Int -> Alex ()
alexSetStartCode sc = Alex $ \s -> Right (s{alex_scd=sc}, ())

#if !defined(ALEX_MONAD_BYTESTRING) && defined(ALEX_MONAD_USER_STATE)
alexGetUserState :: Alex AlexUserState
alexGetUserState = Alex $ \s@AlexState{alex_ust=ust} -> Right (s,ust)

alexSetUserState :: AlexUserState -> Alex ()
alexSetUserState ss = Alex $ \s -> Right (s{alex_ust=ss}, ())
#endif /* !defined(ALEX_MONAD_BYTESTRING) && defined(ALEX_MONAD_USER_STATE) */

alexMonadScan = do
#ifndef ALEX_MONAD_BYTESTRING
  inp__ <- alexGetInput
#else /* ALEX_MONAD_BYTESTRING */
  inp__@(_,_,_,n) <- alexGetInput
#endif /* ALEX_MONAD_BYTESTRING */
  sc <- alexGetStartCode
  case alexScan inp__ sc of
    AlexEOF -> alexEOF
    AlexError ((AlexPn _ line column),_,_,_) -> alexError $ "lexical error at line " ++ (show line) ++ ", column " ++ (show column)
    AlexSkip  inp__' _len -> do
        alexSetInput inp__'
        alexMonadScan
#ifndef ALEX_MONAD_BYTESTRING
    AlexToken inp__' len action -> do
#else /* ALEX_MONAD_BYTESTRING */
    AlexToken inp__'@(_,_,_,n') _ action -> let len = n'-n in do
#endif /* ALEX_MONAD_BYTESTRING */
        alexSetInput inp__'
        action (ignorePendingBytes inp__) len

-- -----------------------------------------------------------------------------
-- Useful token actions

#ifndef ALEX_MONAD_BYTESTRING
type AlexAction result = AlexInput -> Int -> Alex result
#else /* ALEX_MONAD_BYTESTRING */
type AlexAction result = AlexInput -> Int64 -> Alex result
#endif /* ALEX_MONAD_BYTESTRING */

-- just ignore this token and scan another one
-- skip :: AlexAction result
skip _input _len = alexMonadScan

-- ignore this token, but set the start code to a new value
-- begin :: Int -> AlexAction result
begin code _input _len = do alexSetStartCode code; alexMonadScan

-- perform an action for this token, and set the start code to a new value
andBegin :: AlexAction result -> Int -> AlexAction result
(action `andBegin` code) input__ len = do
  alexSetStartCode code
  action input__ len

#ifndef ALEX_MONAD_BYTESTRING
token :: (AlexInput -> Int -> token) -> AlexAction token
#else /* ALEX_MONAD_BYTESTRING */
token :: (AlexInput -> Int64 -> token) -> AlexAction token
#endif /* ALEX_MONAD_BYTESTRING */
token t input__ len = return (t input__ len)
#endif /* defined(ALEX_MONAD) || defined(ALEX_MONAD_BYTESTRING) */


-- -----------------------------------------------------------------------------
-- Basic wrapper

#ifdef ALEX_BASIC
type AlexInput = (Char,[Byte],String)

alexInputPrevChar :: AlexInput -> Char
alexInputPrevChar (c,_,_) = c

-- alexScanTokens :: String -> [token]
alexScanTokens str = go ('\n',[],str)
  where go inp__@(_,_bs,s) =
          case alexScan inp__ 0 of
                AlexEOF -> []
                AlexError _ -> error "lexical error"
                AlexSkip  inp__' _ln     -> go inp__'
                AlexToken inp__' len act -> act (take len s) : go inp__'

alexGetByte :: AlexInput -> Maybe (Byte,AlexInput)
alexGetByte (c,(b:bs),s) = Just (b,(c,bs,s))
alexGetByte (_,[],[])    = Nothing
alexGetByte (_,[],(c:s)) = case utf8Encode' c of
                             (b, bs) -> Just (b, (c, bs, s))
#endif


-- -----------------------------------------------------------------------------
-- Basic wrapper, ByteString version

#ifdef ALEX_BASIC_BYTESTRING

-- alexScanTokens :: ByteString.ByteString -> [token]
alexScanTokens str = go (AlexInput '\n' str 0)
  where go inp__ =
          case alexScan inp__ 0 of
                AlexEOF -> []
                AlexError _ -> error "lexical error"
                AlexSkip  inp__' _len  -> go inp__'
                AlexToken inp__' _ act ->
                  let len = alexBytePos inp__' - alexBytePos inp__ in
                  act (ByteString.take len (alexStr inp__)) : go inp__'

#endif

#ifdef ALEX_STRICT_BYTESTRING

-- alexScanTokens :: ByteString.ByteString -> [token]
alexScanTokens str = go (AlexInput '\n' str 0)
  where go inp__ =
          case alexScan inp__ 0 of
                AlexEOF -> []
                AlexError _ -> error "lexical error"
                AlexSkip  inp__' _len  -> go inp__'
                AlexToken inp__' _ act ->
                  let len = alexBytePos inp__' - alexBytePos inp__ in
                  act (ByteString.take len (alexStr inp__)) : go inp__'

#endif


-- -----------------------------------------------------------------------------
-- Posn wrapper

-- Adds text positions to the basic model.

#ifdef ALEX_POSN
--alexScanTokens :: String -> [token]
alexScanTokens str0 = go (alexStartPos,'\n',[],str0)
  where go inp__@(pos,_,_,str) =
          case alexScan inp__ 0 of
                AlexEOF -> []
                AlexError ((AlexPn _ line column),_,_,_) -> error $ "lexical error at line " ++ (show line) ++ ", column " ++ (show column)
                AlexSkip  inp__' _ln     -> go inp__'
                AlexToken inp__' len act -> act pos (take len str) : go inp__'
#endif


-- -----------------------------------------------------------------------------
-- Posn wrapper, ByteString version

#ifdef ALEX_POSN_BYTESTRING
--alexScanTokens :: ByteString.ByteString -> [token]
alexScanTokens str0 = go (alexStartPos,'\n',str0,0)
  where go inp__@(pos,_,str,n) =
          case alexScan inp__ 0 of
                AlexEOF -> []
                AlexError ((AlexPn _ line column),_,_,_) -> error $ "lexical error at line " ++ (show line) ++ ", column " ++ (show column)
                AlexSkip  inp__' _len       -> go inp__'
                AlexToken inp__'@(_,_,_,n') _ act ->
                  act pos (ByteString.take (n'-n) str) : go inp__'
#endif


-- -----------------------------------------------------------------------------
-- GScan wrapper

-- For compatibility with previous versions of Alex, and because we can.

#ifdef ALEX_GSCAN
alexGScan stop__ state__ inp__ =
  alex_gscan stop__ alexStartPos '\n' [] inp__ (0,state__)

alex_gscan stop__ p c bs inp__ (sc,state__) =
  case alexScan (p,c,bs,inp__) sc of
        AlexEOF     -> stop__ p c inp__ (sc,state__)
        AlexError _ -> stop__ p c inp__ (sc,state__)
        AlexSkip (p',c',bs',inp__') _len ->
          alex_gscan stop__ p' c' bs' inp__' (sc,state__)
        AlexToken (p',c',bs',inp__') len k ->
           k p c inp__ len (\scs -> alex_gscan stop__ p' c' bs' inp__' scs)                  (sc,state__)
#endif
alex_tab_size :: Int
alex_tab_size = 8
alex_base :: Array Int Int
alex_base = listArray (0 :: Int, 46)
  [ -37
  , -102
  , -87
  , -17
  , 0
  , -12
  , -85
  , -93
  , -13
  , 0
  , 46
  , 0
  , 43
  , -16
  , 121
  , 196
  , 271
  , 346
  , 421
  , 496
  , 0
  , 571
  , 646
  , -57
  , 0
  , 721
  , 796
  , 871
  , 946
  , 1021
  , 1096
  , 1171
  , 0
  , 1246
  , 1321
  , 1396
  , 0
  , -6
  , 0
  , 18
  , 0
  , -67
  , 0
  , 0
  , 0
  , 0
  , 0
  ]

alex_table :: Array Int Int
alex_table = listArray (0 :: Int, 1651)
  [ 0
  , 39
  , 5
  , 43
  , 42
  , 45
  , 13
  , 36
  , 12
  , 2
  , 44
  , 24
  , 24
  , 24
  , 24
  , 24
  , 24
  , 24
  , 24
  , 24
  , 24
  , 3
  , 4
  , 8
  , 37
  , 7
  , 9
  , 11
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 1
  , 20
  , 38
  , 40
  , 0
  , 0
  , 27
  , 14
  , 27
  , 27
  , 30
  , 27
  , 27
  , 27
  , 26
  , 27
  , 27
  , 31
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 17
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 23
  , 41
  , 46
  , 0
  , 0
  , 0
  , 0
  , 6
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 32
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 15
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 16
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 10
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 18
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 19
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 34
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 10
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 22
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 35
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 21
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 33
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 28
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 29
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 25
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 27
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  , 0
  ]

alex_check :: Array Int Int
alex_check = listArray (0 :: Int, 1651)
  [ -1
  , 38
  , 39
  , 40
  , 41
  , 42
  , 43
  , 44
  , 45
  , 111
  , 47
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , 108
  , 39
  , 116
  , 61
  , 110
  , 39
  , 43
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , 111
  , 61
  , 38
  , 124
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 98
  , 124
  , 45
  , -1
  , -1
  , -1
  , -1
  , 105
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , 62
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , 48
  , 49
  , 50
  , 51
  , 52
  , 53
  , 54
  , 55
  , 56
  , 57
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 65
  , 66
  , 67
  , 68
  , 69
  , 70
  , 71
  , 72
  , 73
  , 74
  , 75
  , 76
  , 77
  , 78
  , 79
  , 80
  , 81
  , 82
  , 83
  , 84
  , 85
  , 86
  , 87
  , 88
  , 89
  , 90
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , 97
  , 98
  , 99
  , 100
  , 101
  , 102
  , 103
  , 104
  , 105
  , 106
  , 107
  , 108
  , 109
  , 110
  , 111
  , 112
  , 113
  , 114
  , 115
  , 116
  , 117
  , 118
  , 119
  , 120
  , 121
  , 122
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  ]

alex_deflt :: Array Int Int
alex_deflt = listArray (0 :: Int, 46)
  [ -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  , -1
  ]

alex_accept = listArray (0 :: Int, 46)
  [ AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAcc 35
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAccNone
  , AlexAcc 34
  , AlexAcc 33
  , AlexAcc 32
  , AlexAcc 31
  , AlexAcc 30
  , AlexAcc 29
  , AlexAcc 28
  , AlexAcc 27
  , AlexAcc 26
  , AlexAcc 25
  , AlexAcc 24
  , AlexAcc 23
  , AlexAcc 22
  , AlexAcc 21
  , AlexAccNone
  , AlexAcc 20
  , AlexAcc 19
  , AlexAcc 18
  , AlexAcc 17
  , AlexAcc 16
  , AlexAcc 15
  , AlexAcc 14
  , AlexAcc 13
  , AlexAcc 12
  , AlexAcc 11
  , AlexAcc 10
  , AlexAcc 9
  , AlexAcc 8
  , AlexAcc 7
  , AlexAcc 6
  , AlexAccNone
  , AlexAcc 5
  , AlexAccNone
  , AlexAcc 4
  , AlexAcc 3
  , AlexAcc 2
  , AlexAcc 1
  , AlexAcc 0
  ]

alex_actions = array (0 :: Int, 36)
  [ (35,alex_action_8)
  , (34,alex_action_7)
  , (33,alex_action_6)
  , (32,alex_action_5)
  , (31,alex_action_4)
  , (30,alex_action_3)
  , (29,alex_action_22)
  , (28,alex_action_22)
  , (27,alex_action_22)
  , (26,alex_action_22)
  , (25,alex_action_22)
  , (24,alex_action_22)
  , (23,alex_action_2)
  , (22,alex_action_1)
  , (21,alex_action_0)
  , (20,alex_action_23)
  , (19,alex_action_22)
  , (18,alex_action_22)
  , (17,alex_action_22)
  , (16,alex_action_22)
  , (15,alex_action_22)
  , (14,alex_action_22)
  , (13,alex_action_22)
  , (12,alex_action_21)
  , (11,alex_action_20)
  , (10,alex_action_19)
  , (9,alex_action_18)
  , (8,alex_action_17)
  , (7,alex_action_16)
  , (6,alex_action_15)
  , (5,alex_action_14)
  , (4,alex_action_13)
  , (3,alex_action_12)
  , (2,alex_action_11)
  , (1,alex_action_10)
  , (0,alex_action_9)
  ]

{-# LINE 41 "lexer.x" #-}
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
  | Or 
  | And
  | Plus                -- Opérateur d'addition
  | Minus               -- Opérateur de soustraction
  | Mult               -- Opérateur de multiplication
  | Divide              -- Opérateur de division
  | Plusplus            -- Opérateur d'incrément
  | Minusminus          -- Opérateur de décrément
  | Const 
  | Type
  | TInt
  | TBool

  deriving (Eq, Show)

lexer = alexScanTokens
alex_action_0 = \_ -> Let
alex_action_1 = \_ -> In
alex_action_2 = \_ -> Equals
alex_action_3 = \_ -> Plus
alex_action_4 = \_ -> Minus
alex_action_5 = \_ -> Plusplus
alex_action_6 = \_ -> Type
alex_action_7 = \_ -> TInt
alex_action_8 = \_ -> TBool
alex_action_9 = \_ -> Minusminus
alex_action_10 = \_ -> Mult
alex_action_11 = \_ -> Divide
alex_action_12 = \_ -> LParen
alex_action_13 = \_ -> RParen
alex_action_14 = \_ -> Or
alex_action_15 = \_ -> And
alex_action_16 = \_ -> Eq
alex_action_17 = \_ -> Comma
alex_action_18 = \_ -> If
alex_action_19 = \_ -> Then
alex_action_20 = \_ -> Else
alex_action_21 = \_ -> FunArrow
alex_action_22 = \s -> Name s
alex_action_23 = \s -> Int (read s)
alex_action_24 = \_ -> Const

#define ALEX_NOPRED 1
-- -----------------------------------------------------------------------------
-- ALEX TEMPLATE
--
-- This code is in the PUBLIC DOMAIN; you may copy it freely and use
-- it for any purpose whatsoever.

-- -----------------------------------------------------------------------------
-- INTERNALS and main scanner engine

#ifdef ALEX_GHC
#  define ILIT(n) n#
#  define IBOX(n) (I# (n))
#  define FAST_INT Int#
-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#  if __GLASGOW_HASKELL__ > 706
#    define GTE(n,m) (tagToEnum# (n >=# m))
#    define EQ(n,m) (tagToEnum# (n ==# m))
#  else
#    define GTE(n,m) (n >=# m)
#    define EQ(n,m) (n ==# m)
#  endif
#  define PLUS(n,m) (n +# m)
#  define MINUS(n,m) (n -# m)
#  define TIMES(n,m) (n *# m)
#  define NEGATE(n) (negateInt# (n))
#  define IF_GHC(x) (x)
#else
#  define ILIT(n) (n)
#  define IBOX(n) (n)
#  define FAST_INT Int
#  define GTE(n,m) (n >= m)
#  define EQ(n,m) (n == m)
#  define PLUS(n,m) (n + m)
#  define MINUS(n,m) (n - m)
#  define TIMES(n,m) (n * m)
#  define NEGATE(n) (negate (n))
#  define IF_GHC(x)
#endif

#ifdef ALEX_GHC
data AlexAddr = AlexA# Addr#
-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ < 503
uncheckedShiftL# = shiftL#
#endif

{-# INLINE alexIndexInt16OffAddr #-}
alexIndexInt16OffAddr :: AlexAddr -> Int# -> Int#
alexIndexInt16OffAddr (AlexA# arr) off =
#ifdef WORDS_BIGENDIAN
  narrow16Int# i
  where
        i    = word2Int# ((high `uncheckedShiftL#` 8#) `or#` low)
        high = int2Word# (ord# (indexCharOffAddr# arr (off' +# 1#)))
        low  = int2Word# (ord# (indexCharOffAddr# arr off'))
        off' = off *# 2#
#else
#if __GLASGOW_HASKELL__ >= 901
  int16ToInt#
#endif
    (indexInt16OffAddr# arr off)
#endif
#else
alexIndexInt16OffAddr arr off = arr ! off
#endif

#ifdef ALEX_GHC
{-# INLINE alexIndexInt32OffAddr #-}
alexIndexInt32OffAddr :: AlexAddr -> Int# -> Int#
alexIndexInt32OffAddr (AlexA# arr) off =
#ifdef WORDS_BIGENDIAN
  narrow32Int# i
  where
   i    = word2Int# ((b3 `uncheckedShiftL#` 24#) `or#`
                     (b2 `uncheckedShiftL#` 16#) `or#`
                     (b1 `uncheckedShiftL#` 8#) `or#` b0)
   b3   = int2Word# (ord# (indexCharOffAddr# arr (off' +# 3#)))
   b2   = int2Word# (ord# (indexCharOffAddr# arr (off' +# 2#)))
   b1   = int2Word# (ord# (indexCharOffAddr# arr (off' +# 1#)))
   b0   = int2Word# (ord# (indexCharOffAddr# arr off'))
   off' = off *# 4#
#else
#if __GLASGOW_HASKELL__ >= 901
  int32ToInt#
#endif
    (indexInt32OffAddr# arr off)
#endif
#else
alexIndexInt32OffAddr arr off = arr ! off
#endif

#ifdef ALEX_GHC

#if __GLASGOW_HASKELL__ < 503
quickIndex arr i = arr ! i
#else
-- GHC >= 503, unsafeAt is available from Data.Array.Base.
quickIndex = unsafeAt
#endif
#else
quickIndex arr i = arr ! i
#endif

-- -----------------------------------------------------------------------------
-- Main lexing routines

data AlexReturn a
  = AlexEOF
  | AlexError  !AlexInput
  | AlexSkip   !AlexInput !Int
  | AlexToken  !AlexInput !Int a

-- alexScan :: AlexInput -> StartCode -> AlexReturn a
alexScan input__ IBOX(sc)
  = alexScanUser undefined input__ IBOX(sc)

alexScanUser user__ input__ IBOX(sc)
  = case alex_scan_tkn user__ input__ ILIT(0) input__ sc AlexNone of
  (AlexNone, input__') ->
    case alexGetByte input__ of
      Nothing ->
#ifdef ALEX_DEBUG
                                   trace ("End of input.") $
#endif
                                   AlexEOF
      Just _ ->
#ifdef ALEX_DEBUG
                                   trace ("Error.") $
#endif
                                   AlexError input__'

  (AlexLastSkip input__'' len, _) ->
#ifdef ALEX_DEBUG
    trace ("Skipping.") $
#endif
    AlexSkip input__'' len

  (AlexLastAcc k input__''' len, _) ->
#ifdef ALEX_DEBUG
    trace ("Accept.") $
#endif
    AlexToken input__''' len (alex_actions ! k)


-- Push the input through the DFA, remembering the most recent accepting
-- state it encountered.

alex_scan_tkn user__ orig_input len input__ s last_acc =
  input__ `seq` -- strict in the input
  let
  new_acc = (check_accs (alex_accept `quickIndex` IBOX(s)))
  in
  new_acc `seq`
  case alexGetByte input__ of
     Nothing -> (new_acc, input__)
     Just (c, new_input) ->
#ifdef ALEX_DEBUG
      trace ("State: " ++ show IBOX(s) ++ ", char: " ++ show c) $
#endif
      case fromIntegral c of { IBOX(ord_c) ->
        let
                base   = alexIndexInt32OffAddr alex_base s
                offset = PLUS(base,ord_c)

                new_s = if GTE(offset,ILIT(0))
                          && let check  = alexIndexInt16OffAddr alex_check offset
                             in  EQ(check,ord_c)
                          then alexIndexInt16OffAddr alex_table offset
                          else alexIndexInt16OffAddr alex_deflt s
        in
        case new_s of
            ILIT(-1) -> (new_acc, input__)
                -- on an error, we want to keep the input *before* the
                -- character that failed, not after.
            _ -> alex_scan_tkn user__ orig_input
#ifdef ALEX_LATIN1
                   PLUS(len,ILIT(1))
                   -- issue 119: in the latin1 encoding, *each* byte is one character
#else
                   (if c < 0x80 || c >= 0xC0 then PLUS(len,ILIT(1)) else len)
                   -- note that the length is increased ONLY if this is the 1st byte in a char encoding)
#endif
                   new_input new_s new_acc
      }
  where
        check_accs (AlexAccNone) = last_acc
        check_accs (AlexAcc a  ) = AlexLastAcc a input__ IBOX(len)
        check_accs (AlexAccSkip) = AlexLastSkip  input__ IBOX(len)
#ifndef ALEX_NOPRED
        check_accs (AlexAccPred a predx rest)
           | predx user__ orig_input IBOX(len) input__
           = AlexLastAcc a input__ IBOX(len)
           | otherwise
           = check_accs rest
        check_accs (AlexAccSkipPred predx rest)
           | predx user__ orig_input IBOX(len) input__
           = AlexLastSkip input__ IBOX(len)
           | otherwise
           = check_accs rest
#endif

data AlexLastAcc
  = AlexNone
  | AlexLastAcc !Int !AlexInput !Int
  | AlexLastSkip     !AlexInput !Int

data AlexAcc user
  = AlexAccNone
  | AlexAcc Int
  | AlexAccSkip
#ifndef ALEX_NOPRED
  | AlexAccPred Int (AlexAccPred user) (AlexAcc user)
  | AlexAccSkipPred (AlexAccPred user) (AlexAcc user)

type AlexAccPred user = user -> AlexInput -> Int -> AlexInput -> Bool

-- -----------------------------------------------------------------------------
-- Predicates on a rule

alexAndPred p1 p2 user__ in1 len in2
  = p1 user__ in1 len in2 && p2 user__ in1 len in2

--alexPrevCharIsPred :: Char -> AlexAccPred _
alexPrevCharIs c _ input__ _ _ = c == alexInputPrevChar input__

alexPrevCharMatches f _ input__ _ _ = f (alexInputPrevChar input__)

--alexPrevCharIsOneOfPred :: Array Char Bool -> AlexAccPred _
alexPrevCharIsOneOf arr _ input__ _ _ = arr ! alexInputPrevChar input__

--alexRightContext :: Int -> AlexAccPred _
alexRightContext IBOX(sc) user__ _ _ input__ =
     case alex_scan_tkn user__ input__ ILIT(0) input__ sc AlexNone of
          (AlexNone, _) -> False
          _ -> True
        -- TODO: there's no need to find the longest
        -- match when checking the right context, just
        -- the first match will do.
#endif
