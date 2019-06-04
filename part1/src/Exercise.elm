module Exercise exposing (main)

import Browser
import Element exposing (column, el, text)
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
    = Inc
    | Dec


update : Msg -> Model -> Model
update msg model =
    case msg of
        Inc ->
            { model | age = model.age + 1 }

        Dec ->
            { model | age = model.age - 1 }


view : Model -> Html Msg
view model =
    Element.layout []
        (column
            [ Element.centerX
            , Element.centerY
            ]
            [ el
                [ Region.heading 1
                , Font.size 36
                , Font.bold
                , onClick Inc
                ]
                (text
                    ("Hello "
                        ++ model.name
                        ++ ". You seem to be "
                        ++ String.fromInt model.age
                        ++ " years old."
                    )
                )
            , el [ onClick Dec ]
                (text "No,I'm not!")
            ]
        )


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }
