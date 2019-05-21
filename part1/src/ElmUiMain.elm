module Main exposing (main)

import Browser
import Element exposing (el, text)
import Element.Events exposing (onClick)
import Element.Font as Font
import Element.Region as Region
import Html exposing (Html)


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
    Element.layout []
        (el
            [ Element.centerX
            , Element.centerY
            , Region.heading 1
            , Font.size 36
            , Font.bold
            , onClick Click
            ]
            (text
                ("Hello "
                    ++ model.name
                    ++ ". You seem to be "
                    ++ String.fromInt model.age
                    ++ " years old."
                )
            )
        )


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
