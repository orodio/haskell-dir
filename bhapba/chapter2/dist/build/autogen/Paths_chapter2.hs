module Paths_chapter2 (
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
version = Version {versionBranch = [0,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/orodio/.cabal/bin"
libdir     = "/Users/orodio/.cabal/lib/x86_64-osx-ghc-7.8.3/chapter2-0.0.1"
datadir    = "/Users/orodio/.cabal/share/x86_64-osx-ghc-7.8.3/chapter2-0.0.1"
libexecdir = "/Users/orodio/.cabal/libexec"
sysconfdir = "/Users/orodio/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "chapter2_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "chapter2_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "chapter2_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "chapter2_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "chapter2_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
