//
//  ViewController.swift
//  TicTacToeGame
//
//  Created by Alena Belenets on 05.05.2023.
//

import UIKit

enum Turn {
    case Null
    case Crosse
}

class TicTacToeGameViewController: UIViewController {




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

    var firstTurn = Turn.Crosse
    var currentTurn = Turn.Crosse

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func tapOnScreenAction(_ sender: UIButton) {
    }


}

