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
    
    //Board
    var board = [UIButton]()
    
    //Scoreboard
    var noughtsScore = 0
    var crossesScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
    }

    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        
        if checkForVictory(CROSS){
            crossesScore += 1
            resultAlert(title: "Crosses Won!")
        }
        if checkForVictory(NOUGHT){
            noughtsScore += 1
            resultAlert(title: "Noughts Won!")
        }
        
        
        if(isBoardFull()){
            resultAlert(title: "Draw")
        }
    }
    
    //Checks each space of the grid to check if its already full
    func isBoardFull() -> Bool {
        for button in board{
            if button.title(for: .normal) == nil {
                return false
            }
        }
        return true
    }
    
    //Adds the move to the board
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
            sender.isEnabled = false
        }
    }
    
    //Checks for victory
    func checkForVictory(_ s :String) -> Bool {
        //Horizontal win
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s){
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s){
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s){
            return true
        }
        
        //Vertical win
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s){
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s){
            return true
        }
        
        //Diagonal win
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s){
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s){
            return true
        }
        
        return false
    }
    
    //Returns whether the symbol matches or not
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    
    //Shows results in alert box with reset button
    func resultAlert(title: String){
        let message = "\nNoughts: " + String(noughtsScore) + "\nCrosses: " + String(crossesScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    //Clears up the board for a new match and changes starting turn
    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if(firstTurn == Turn.Nought){
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        } else {
            firstTurn = Turn.Nought
            turnLabel.text = NOUGHT
        }
        currentTurn = firstTurn
    }
    
}

