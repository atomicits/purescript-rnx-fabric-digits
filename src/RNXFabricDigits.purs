module RNXFabricDigits where

import Prelude
import Control.Monad.Aff (Aff, makeAff, attempt)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Exception (Error)
import Data.Either (Either)
--import Network.HTTP.Affjax (AJAX)
import Data.Argonaut (Json)

foreign import _login :: forall e scallback ecallback. LoginOptions
                       -> scallback
                       -> ecallback
                       -> Eff e Unit

foreign import _getSession :: forall e scallback ecallback . scallback
                              -> ecallback
                              -> Eff e Unit

foreign import _logout :: forall e scallback ecallback . scallback
                              -> ecallback
                              -> Eff e Unit

type LoginOptions = {phoneNumber :: String}


login :: forall e. LoginOptions -> Aff e (Either Error Json)
login options = attempt $ makeAff (\error success -> _login options success error)


getSession :: forall e. Aff e (Either Error Json)
getSession = attempt $ makeAff (\error success -> _getSession success error)

logout :: forall e. Aff e (Either Error Boolean)
logout = attempt $ makeAff (\error success -> _logout success error)
