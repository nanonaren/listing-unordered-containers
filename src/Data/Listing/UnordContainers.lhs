-----------------------------------------------------------------------------
-- |
-- Module      :  Data.Listing.UnordContainers
-- Copyright   :  (C) 2013 Naren Sundar
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Naren Sundar <nano.naren@gmx.com>
-- Stability   :  experimental
-- Portability :  portable
--
----------------------------------------------------------------------------

\begin{code}

{-# LANGUAGE TypeFamilies #-}

module Data.Listing.UnordContainers
    (
    ) where

import Data.Listing
import Data.Hashable (Hashable)
import qualified Data.HashSet as HS
import qualified Data.HashMap.Strict as MS

instance (Hashable a,Ord a) => Listing (HS.HashSet a) where
    type Elem (HS.HashSet a) = a
    type Index (HS.HashSet a) = a
    type IndexElem (HS.HashSet a) = Bool
    toList = HS.toList
    fromList = HS.fromList
    lookup s i = if HS.member i s then Just True else Nothing
    (!) = flip HS.member
    singleton = HS.singleton
    size = HS.size
    empty = HS.empty
    null = HS.null

instance (Hashable k,Eq k) => Listing (MS.HashMap k a) where
    type Elem (MS.HashMap k a) = (k,a)
    type Index (MS.HashMap k a) = k
    type IndexElem (MS.HashMap k a) = a
    toList = MS.toList
    fromList = MS.fromList
    lookup m k = MS.lookup k m
    (!) = (MS.!)
    singleton (k,v) = MS.singleton k v
    size = MS.size
    empty = MS.empty
    null = MS.null

\end{code}