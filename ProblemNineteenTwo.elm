module Main exposing (..)

import Html
import List


rotate : Int -> List a -> List a
rotate rot list =
    case list of
        [] ->
            []

        _ ->
            let
                remainder =
                    rem rot (List.length list)
            in
            if rot == 0 then
                list
            else if rot > 0 then
                List.drop remainder list ++ List.take remainder list
            else
                let
                    x =
                        List.length list + remainder
                in
                List.drop x list ++ List.take x list


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ toString x ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ rotate 3 [ 1, 2, 5, 5, 2, 1 ] == [ 5, 2, 1, 1, 2, 5 ]
            , rotate 13 (List.range 1 10) == [ 4, 5, 6, 7, 8, 9, 10, 1, 2, 3 ]
            , rotate 1 (List.range 1 5) == [ 2, 3, 4, 5, 1 ]
            , rotate 0 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , rotate -1 (List.range 1 5) == [ 5, 1, 2, 3, 4 ]
            , rotate -6 (List.range 1 5) == [ 5, 1, 2, 3, 4 ]
            , rotate 3 (List.range 1 5) == [ 4, 5, 1, 2, 3 ]
            , rotate 1 [ "1", "2", "3", "4" ] == [ "2", "3", "4", "1" ]
            , rotate 1 [] == []
            ]
