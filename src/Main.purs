module Main where

import Prelude

import Effect (Effect)
import Sketch.UI as UI

helloWorld :: Effect Unit
helloWorld = UI.message "Hello World..."