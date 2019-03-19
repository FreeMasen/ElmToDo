module DateTime exposing (..)
import Time exposing (..)
import Task exposing (Task)

type alias DateTime = {
    time: Time.Posix
    , tz: Time.Zone
    }
now : () -> DateTime
now () = 
    DateTime (Time.now) Task.perform Time.here