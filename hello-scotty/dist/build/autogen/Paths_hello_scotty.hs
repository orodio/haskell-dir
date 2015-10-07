module Paths_hello_scotty (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/orodio/.cabal/bin"
libdir     = "/Users/orodio/.cabal/lib/x86_64-osx-ghc-7.8.4/hello-scotty-0.1.0.0"
datadir    = "/Users/orodio/.cabal/share/x86_64-osx-ghc-7.8.4/hello-scotty-0.1.0.0"
libexecdir = "/Users/orodio/.cabal/libexec"
sysconfdir = "/Users/orodio/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "hello_scotty_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "hello_scotty_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "hello_scotty_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "hello_scotty_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "hello_scotty_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
