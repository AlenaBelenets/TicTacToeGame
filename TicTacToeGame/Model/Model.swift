//
//  Model.swift
//  TicTacToeGame
//
//  Created by Alena Belenets on 05.05.2023.
//

import Foundation

struct Gamers {
    var nameOfFirstPlayer: String
    var nameOfSecondPlayer: String

    var firstPlayerScore: Int
    var secondPlayerScore: Int

    static func getGamersData() -> Gamers {
       Gamers(
        nameOfFirstPlayer: "First player",
        nameOfSecondPlayer: "Second player",
        firstPlayerScore: 0,
        secondPlayerScore: 0
       )
    }

}

struct Game {
    let zero = "O"
    let cross = "X"
}

