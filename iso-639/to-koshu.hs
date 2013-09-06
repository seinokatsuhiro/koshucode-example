#!/usr/bin/env runhaskell
{-# OPTIONS_GHC -Wall #-}
-- ------------------------------------------------------------------
--
--  DESCRIPTION
--    Convert ISO-639-2 code list to Koshucode.
--
--  USAGE
--    chmod 755 to-koshu.hs
--    ./to-koshu.hs < ISO-639-2.txt \
--       | koshu -i decompose.k > ISO-639-2.k
--
-- ------------------------------------------------------------------

import qualified Koshucode.Baala.Base as B
import qualified Koshucode.Baala.Core as C
import qualified Koshucode.Baala.Vanilla as V

main :: IO ()
main =
    do src <- getContents
       let ls  = lines src
           ls' = map (B.divideBy (== '|')) ls
           js  = map toJudge ls'
       B.putJudges js

toJudge :: [String] -> B.Judge V.VContent
toJudge [alpha3bib, alpha3term, alpha2, english, french] =
    B.Judge True "ISO-639-2"
         [ ("/alpha3"  , C.putText alpha3bib)
         , ("/alpha3t" , C.putText alpha3term)
         , ("/alpha2"  , C.putText alpha2)
         , ("/english" , C.putText english)
         , ("/french"  , C.putText french) ]
toJudge xs = error $ "FORMAT ERROR: " ++ show xs

