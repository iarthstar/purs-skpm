module Lib.Sketch where

import Prelude (Unit, pure, (*>), (>>>)) 
import Data.Either
import Effect (Effect) 
import Effect.Aff (Aff, Error, makeAff, nonCanceler)
import Foreign (Foreign) 

foreign import getSelection :: Effect Foreign
foreign import showAlert :: String -> String -> Effect Unit
foreign import showMessage :: String -> Effect Unit
foreign import copy2Pasteboard :: String -> Effect Unit

foreign import _getInputFromUser :: String -> String -> (String -> Effect Unit) -> (Error -> Effect Unit) -> Effect Unit

getInputFromUser :: String -> String -> Aff String
getInputFromUser msg initValue = makeAff (\cb -> _getInputFromUser msg initValue  (Right >>> cb)  (Left >>> cb) *> pure nonCanceler)
