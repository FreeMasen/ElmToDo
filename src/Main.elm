import Browser
import Html exposing (Html, button, div, text, input, span)
import Html.Events exposing (onClick, onInput)
import Html.Attributes exposing (..)
import Json.Encode as E

import Data exposing (..)
import ToDo exposing (..)

main = 
    Browser.sandbox { init = init, update = update, view = view }

type alias Model = 
    {
        todos: List ToDo
        , pendingToDo: String
    }

init : Model
init = 
    {
        todos = [ToDo 0 "thing" [] "now" "none" Incomplete]
        , pendingToDo = ""
    }

type Msg 
    = NewState (List ToDo)
    | UpdatePending String
    | NewToDo String
    | AddNote Int String
    | MoveNote Int State
    | DeleteNote Int

update : Msg -> Model -> Model
update msg model = 
    case msg of
        UpdatePending newValue ->
            { model | pendingToDo = newValue }
        NewState newList ->
            { model | todos = newList }
        NewToDo name ->
            let _ = Data.postMessage (E.object [("event", E.string "newToDo"), ("name", E.string  name)]) in 
            model
        AddNote id value ->
            -- let _ = Data.postMessage (E.object [("event", E.string "newNote", ("id", E.int id), ("value", E.string value))]) in
            model
        MoveNote id state ->
            model
        DeleteNote id ->
            model

view : Model -> Html Msg
view model =
    div [class "todo-list-container"]
    [
        div [class "new-todo-container"] [
            input [placeholder "New ToDo", onInput UpdatePending ] []
            ,button [type_ "button", onClick (NewToDo model.pendingToDo)] [text "Add Note"]
        ]
        ,div [class "todo-list-container"]
            (List.map todoElement model.todos)
    ]

todoElement : ToDo -> Html Msg
todoElement todo =
    div [class "todo-list-entry"] 
    [
        span [class "todo-list-name"] [text todo.name]
    ]