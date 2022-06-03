//
//  ViewController.swift
//  TicTacToe
//
//  Created by Abhijeet Banarase on 03/06/2022.
//

import UIKit

class ViewController: UIViewController
{
  
  enum Turn
  {
    case Nought
    case Cross
  }

  @IBOutlet weak var turnLabel: UILabel!
  
  @IBOutlet weak var a1: UIButton!
  @IBOutlet weak var a2: UIButton!
  @IBOutlet weak var a3: UIButton!
  @IBOutlet weak var b1: UIButton!
  @IBOutlet weak var b2: UIButton!
  @IBOutlet weak var b3: UIButton!
  @IBOutlet weak var c1: UIButton!
  @IBOutlet weak var c2: UIButton!
  @IBOutlet weak var c3: UIButton!
  
  var firstTurn = Turn.Cross
  var currentTurn = Turn.Cross
  
  var NOUGHT = "O"
  var CROSS = "X"
  var board = [UIButton]()
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    initBoard()
  }
  
  func initBoard()
  {
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

  @IBAction func boardTapAction(_ sender: UIButton)
  {
    addToBorad(sender)
    
    if(isFullBoard())
    {
      resultAlert(title: "Draw!")
    }
  }
  
  func resultAlert(title: String)
  {
    let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
    ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { _ in
      self.resetBoard()
    }))
    
    self.present(ac, animated: true)
  }
  
  func resetBoard()
  {
    board.forEach { button in
      button.setTitle(nil, for: .normal)
      button.isEnabled = true
    }
    
    if firstTurn == Turn.Nought
    {
      firstTurn = Turn.Cross
      turnLabel.text = CROSS
    }
    else if firstTurn == Turn.Cross
    {
      firstTurn = Turn.Nought
      turnLabel.text = NOUGHT
    }
      currentTurn = firstTurn
  }
  
  func isFullBoard() -> Bool
  {
    let fullBoard = board.filter() { button in
       button.title(for: .normal) != nil
    }.count == 9
    
    return fullBoard
  }
  
  func addToBorad(_ sender: UIButton)
  {
    if(sender.title(for: .normal) == nil)
    {
      if(currentTurn == Turn.Nought)
      {
        sender.setTitle(NOUGHT, for: .normal)
        currentTurn = Turn.Cross
        turnLabel.text = CROSS
      }
      else if(currentTurn == Turn.Cross)
      {
        sender.setTitle(CROSS, for: .normal)
        currentTurn = Turn.Nought
        turnLabel.text = NOUGHT
      }
    }
    
    sender.isEnabled = false
  }
  
}

