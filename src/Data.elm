port module Data exposing (..)

import Json.Encode as E

port postMessage: E.Value -> Cmd msg

type Msg
    = ToDoList E.Value

port todoList : (E.Value -> msg) -> Sub msg