//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Alena Belenets on 05.05.2023.
//

import UIKit

//    MARK: - enum
enum Turn {
    case Zero
    case Cross
}

//    MARK: - TicTacToeGameViewController
class TicTacToeGameViewController: UIViewController {

//    MARK: - IBOutlets
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

    //    MARK: - Properties
    var gamers: Gamers!

    private let turn = Game()
    private var firstTurn = Turn.Cross
    private var currentTurn = Turn.Cross
    private var board = [UIButton]()

    //    MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        addFirstName()
        initBoard()
    }

    //    MARK: - IBActions
    @IBAction func tapOnScreenAction(_ sender: UIButton) {
        addToGame(sender)

        if checkForVictory(turn.cross) {
            gamers.firstPlayerScore += 1
            resultAlert(title: "\(gamers.nameOfFirstPlayer) win!")
        } else if checkForVictory(turn.zero) {
            gamers.secondPlayerScore += 1
            resultAlert(title: "\(gamers.nameOfSecondPlayer) win!")
        }

        if fullBoard() {
            resultAlert(title: "Draw :( Let's start a new game!")
        }
    }

    //    MARK: - Private methods
   private func addToGame(_ sender: UIButton) {
        guard sender.title(for: .normal) == nil else { return }

        if currentTurn == Turn.Zero {
            sender.setTitle(turn.zero, for: .normal)
            currentTurn = Turn.Cross
            gamesTurnLabel.text = gamers.nameOfFirstPlayer
        }
        else if currentTurn == Turn.Cross {
            sender.setTitle(turn.cross, for: .normal)
            currentTurn = Turn.Zero
            gamesTurnLabel.text = gamers.nameOfSecondPlayer
        }

        sender.isEnabled = false

    }

    private func addFirstName() {
        gamesTurnLabel.text = gamers.nameOfFirstPlayer
    }

    private func initBoard() {
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

    private func fullBoard() -> Bool {
        for button in board {
            if button.title(for: .normal) == nil  {
                return false
            }
        }
        return true
    }


    private func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Zero {
            firstTurn = Turn.Cross
            gamesTurnLabel.text = gamers.nameOfFirstPlayer
        }
        else if firstTurn == Turn.Cross {
            firstTurn = Turn.Zero
            gamesTurnLabel.text = gamers.nameOfSecondPlayer
        }
        currentTurn = firstTurn

    }

    private func checkForVictory(_ s: String) -> Bool {
        if finalSymbol(a1Button, s) && finalSymbol(a2Button, s) && finalSymbol(a3Button, s) {
            return true
        }
        if finalSymbol(a4Button, s) && finalSymbol(a5Button, s) && finalSymbol(a6Button, s) {
            return true
        }
        if finalSymbol(a7Button, s) && finalSymbol(a8Button, s) && finalSymbol(a9Button, s) {
            return true
        }

        if finalSymbol(a1Button, s) && finalSymbol(a4Button, s) && finalSymbol(a7Button, s) {
            return true
        }
        if finalSymbol(a2Button, s) && finalSymbol(a5Button, s) && finalSymbol(a8Button, s) {
            return true
        }
        if finalSymbol(a3Button, s) && finalSymbol(a6Button, s) && finalSymbol(a9Button, s) {
            return true
        }

        if finalSymbol(a1Button, s) && finalSymbol(a5Button, s) && finalSymbol(a9Button, s) {
            return true
        }
        if finalSymbol(a3Button, s) && finalSymbol(a5Button, s) && finalSymbol(a7Button, s) {
            return true
        }

        return false

    }

    private func finalSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }

}

//    MARK: - UIAlertController
extension TicTacToeGameViewController {
    private func resultAlert(title: String) {
        let message = "\nFirst player " + String(gamers.firstPlayerScore) +
        "\n \nSecond player " + String(gamers.secondPlayerScore)
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
}
