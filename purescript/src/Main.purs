module Main where

import Prelude (Unit)
import Effect (Effect)
import Sketch.UI as UI

myCommand :: Effect Unit
myCommand = do
  UI.message "It's alive 🙌"  
