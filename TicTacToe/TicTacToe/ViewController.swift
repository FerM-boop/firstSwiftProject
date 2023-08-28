//
//  ViewController.swift
//  TicTacToe
//
//  Created by Fernando Mejorado Tinoco on 27/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    //Turns
    enum Turn {
        case Nought
        case Cross
    }
    
    //Changing Turn Label
    @IBOutlet weak var turnLabel: UILabel!
    
    //Grid created by buttons
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    //Initial Turn Value
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross

    //Different values for turn
    var NOUGHT = "O"
    var CROSS = "X"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
    }
    
    func addToBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(currentTurn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Nought
                turnLabel.text = NOUGHT
            } else {
                sender.setTitle(NOUGHT, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            }
        }
    }
    
}

