module ToDo exposing (..)
import Data exposing (..)

type State 
    = Incomplete
    | Review
    | Complete

type alias ToDo = { 
    id: Int
    , name: String
    , notes: List String
    , created: String
    , updated: String
    , state: State
    }

        