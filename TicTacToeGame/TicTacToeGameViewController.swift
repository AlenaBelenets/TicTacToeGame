//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Alena Belenets on 05.05.2023.
//

import UIKit

enum Turn {
    case Zero
    case Cross
}

class TicTacToeGameViewController: UIViewController {

    var ticTacToe = Gamers()
    let turn = Game()


    @IBOutlet weak var gamesTurnLabel: UILabel!

    @IBOutlet weak var a1Button: UIButton!
    @IBOutlet weak var a2Button: UIButton!
    @IBOutlet weak var a3Button: UIButton!
    @IBOutlet weak var a4Button: UIButton!
    @IBOutlet weak var a5Button: UIButton!
    @IBOutlet weak var a6Button: UIButton!
    @IBOutlet weak var a7Button: UIButton!
    @IBOutlet weak var a8Button: UIButton!
    @IBOutlet weak var a9Button: UIButton!

    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    var board = [UIButton]()
   


    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()

    }


    @IBAction func tapOnScreenAction(_ sender: UIButton) {
        addToGame(sender)

        if checkForVictory(turn.cross) {
            ticTacToe.firstPlayerScore += 1
            resultAlert(title: "Crosse win!")
        } else if checkForVictory(turn.zero) {
            ticTacToe.secondPlayerScore += 1
            resultAlert(title: "Zero win!")
        }

        if fullBoard() {
            resultAlert(title: "Draw :( Let's start a new game!")
        }
    }


    func addToGame(_ sender: UIButton) {
        guard sender.title(for: .normal) == nil else { return }

        if currentTurn == Turn.Zero {
            sender.setTitle(turn.zero, for: .normal)
            currentTurn = Turn.Cross
            gamesTurnLabel.text = ticTacToe.nameOfFirstPlayer
        }
        else if currentTurn == Turn.Cross {
            sender.setTitle(turn.cross, for: .normal)
            currentTurn = Turn.Zero
            gamesTurnLabel.text = ticTacToe.nameOfSecondPlayer
        }

        sender.isEnabled = false

    }

    func initBoard() {
        board.append(a1Button)
        board.append(a2Button)
        board.append(a3Button)
        board.append(a4Button)
        board.append(a5Button)
        board.append(a6Button)
        board.append(a7Button)
        board.append(a8Button)
        board.append(a9Button)
    }

    func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil  {
                return false

            }
        }
        return true
    }

    func resultAlert(title: String) {
        let message = "\nFirst player " + String(ticTacToe.firstPlayerScore) +
        "\n \nSecond player " + String(ticTacToe.secondPlayerScore)
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .actionSheet
        )
        alert.addAction(UIAlertAction(
            title: "Reset",
            style: .default,
            handler: { (_) in self.resetBoard() }
        )
        )
        self.present(alert, animated: true)
    }

    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Zero {
            firstTurn = Turn.Cross
            gamesTurnLabel.text = ticTacToe.nameOfFirstPlayer
        }
        else if firstTurn == Turn.Cross {
            firstTurn = Turn.Zero
            gamesTurnLabel.text = ticTacToe.nameOfSecondPlayer
        }
        currentTurn = firstTurn

    }
    func checkForVictory(_ s: String) -> Bool {
//        Horizontal victory
        if finalSymbol(a1Button, s) && finalSymbol(a2Button, s) && finalSymbol(a3Button, s) {
            return true
        }
        if finalSymbol(a4Button, s) && finalSymbol(a5Button, s) && finalSymbol(a6Button, s) {
            return true
        }
        if finalSymbol(a7Button, s) && finalSymbol(a8Button, s) && finalSymbol(a9Button, s) {
            return true
        }
//        Vertical victory
        if finalSymbol(a1Button, s) && finalSymbol(a4Button, s) && finalSymbol(a7Button, s) {
            return true
        }
        if finalSymbol(a2Button, s) && finalSymbol(a5Button, s) && finalSymbol(a8Button, s) {
            return true
        }
        if finalSymbol(a3Button, s) && finalSymbol(a6Button, s) && finalSymbol(a9Button, s) {
            return true
        }
//        Diagonal victory
        if finalSymbol(a1Button, s) && finalSymbol(a5Button, s) && finalSymbol(a9Button, s) {
            return true
        }
        if finalSymbol(a3Button, s) && finalSymbol(a5Button, s) && finalSymbol(a7Button, s) {
            return true
        }

        return false

    }
    func finalSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }

}

