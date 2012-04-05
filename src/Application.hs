{-

This module defines our application's monad and any application-specific
information it requires.

-}

{-# LANGUAGE TypeSynonymInstances, MultiParamTypeClasses, TemplateHaskell #-}

module Application where

import           Data.Lens.Template
import           Data.Time.Clock
import           Snap.Snaplet
import           Snap.Snaplet.Heist


data App = App
    { _heist :: Snaplet (Heist App)
    , _startTime :: UTCTime
    }

makeLens ''App

instance HasHeist App where
    heistLens = subSnaplet heist


------------------------------------------------------------------------------
type AppHandler = Handler App App
