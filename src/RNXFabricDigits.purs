module RNXFabricDigits where

import Prelude
import Control.Monad.Aff (makeAff, attempt, Aff)
import Control.Monad.Eff (Eff)
import Data.Either(Either)
import Control.Monad.Eff.Exception (Error)

foreign import _login :: forall e scallback ecallback. LoginOptions
                       -> scallback
                       -> ecallback
                       -> Eff e Unit

foreign import _getSession :: forall e scallback ecallback . scallback
                              -> ecallback
                              -> Eff e Unit

foreign import _logout :: forall e. Eff e Unit

type LoginOptions = {phoneNumber :: String}


login :: forall e. LoginOptions -> Aff e (Either Error String)
login options = attempt $ makeAff (\error success -> _login options success error)


getSession :: forall e. Aff e (Either Error String)
getSession = attempt $ makeAff (\error success -> _getSession success error)

logout :: forall e. Eff e Unit
logout = _logout
