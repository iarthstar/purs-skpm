module Main where

import Prelude (Unit)
import Effect (Effect)
import Lib.Sketch (showMessage)

myCommand :: Effect Unit
myCommand = do
  showMessage "It's alive 🙌"  
