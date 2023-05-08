//
//  AddNamesViewController.swift
//  TicTacToeGame
//
//  Created by Alena Belenets on 06.05.2023.
//

import UIKit

class AddNamesViewController: UIViewController {

    //    MARK: - IBOutlets
    @IBOutlet weak var firstPlayerName: UITextField!
    @IBOutlet weak var secondPlayerName: UITextField!

    //    MARK: - Private properties
    private var users = Gamers(
        nameOfFirstPlayer: "",
        nameOfSecondPlayer: "",
        firstPlayerScore: 0,
        secondPlayerScore: 0)

    //    MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPlayerName.text = users.nameOfFirstPlayer
        secondPlayerName.text = users.nameOfSecondPlayer

    }
    //    MARK: - IBAction
    @IBAction func doneButtonWasTapped(_ sender: UIButton) {
        guard !(firstPlayerName.text?.isEmpty ?? true)
                && !(secondPlayerName.text?.isEmpty ?? true) else {
            showAlert(title: "Sorry", message: "Please, enter your names")
            return
        }
        performSegue(withIdentifier: "seque", sender: nil)
    }
    
    //    MARK: - Method prepare
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ticTacToeVC = segue.destination as? TicTacToeGameViewController else { return }
         users.nameOfFirstPlayer = firstPlayerName.text ?? "First player"
         users.nameOfSecondPlayer = secondPlayerName.text ?? "Second player"
         ticTacToeVC.gamers = users
    }
}

//    MARK: - UIAlertController
extension AddNamesViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}
