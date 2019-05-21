module Main exposing (main)

import Browser
import Html exposing (Html, h1, text)
import Html.Events exposing (onClick)


init : Model
init =
    { name = "Hans"
    , age = 37
    }


type alias Model =
    { name : String
    , age : Int
    }


type Msg
    = Click


update : Msg -> Model -> Model
update msg model =
    case msg of
        Click ->
            { model | age = model.age + 1 }


view : Model -> Html Msg
view model =
    h1 [ onClick Click ]
        [ text
            ("Hello "
                ++ model.name
                ++ ". You seem to be "
                ++ String.fromInt model.age
                ++ " years old."
            )
        ]

main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
