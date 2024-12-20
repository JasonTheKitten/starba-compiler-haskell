module Main where

import System.Environment ( getArgs )
import System.IO ( stderr, hPutStrLn, hPrint )

import Text.Parsec

import Parser
import AST

main :: IO ()
main = do
  args <- getArgs
  case args of
    [filename] -> do
      contents <- readFile filename
      case parse parseModule filename contents of
        Left err -> hPrint stderr err
        Right ast -> print ast
    _ -> hPutStrLn stderr "Usage: starba <filename>"