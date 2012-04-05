 {-# LANGUAGE OverloadedStrings, DoAndIfThenElse #-}

{-|

This is where all the routes and handlers are defined for your site. The
'site' function combines everything together and is exported by this module.

-}

import           CreatureTables
import           QueryLite
import           System.Environment

buildTableIf :: [String] -> TableDef -> IO()
buildTableIf args t = 
    if ((toStr (getTableName t)) `elem` args) || ("all" `elem` args) then (buildTable t "encounter_db") else return ()

main :: IO()
main = do
    args <- getArgs
    if [] == args 
       then putStrLn "Usage: BuildTables table_name1 [table_name2 ...]"
       else sequence_ $  map (buildTableIf args) allCreatureTables


