//
//  ViewController.swift
//  2048
//
//  Created by Yilin Zhao on 12/30/19.
//  Copyright © 2019 Yijia Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var square00: UIView!
    @IBOutlet weak var square01: UIView!
    @IBOutlet weak var square02: UIView!
    @IBOutlet weak var square03: UIView!
    @IBOutlet weak var square10: UIView!
    @IBOutlet weak var square11: UIView!
    @IBOutlet weak var square12: UIView!
    @IBOutlet weak var square13: UIView!
    @IBOutlet weak var square20: UIView!
    @IBOutlet weak var square21: UIView!
    @IBOutlet weak var square22: UIView!
    @IBOutlet weak var square23: UIView!
    @IBOutlet weak var square30: UIView!
    @IBOutlet weak var square31: UIView!
    @IBOutlet weak var square32: UIView!
    @IBOutlet weak var square33: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        restartGame()
    }
    
    var board = Board()
    var popUpDisplayed = false
    var occupiedSquare = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //Do any additional setup after loading the view.
    
        addSwipe()
        board.newSquare()
        refreshView()
    }

    func addSwipe() {
        let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left, .up, .down]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe(sender:)))
            gesture.direction = direction
            self.view.addGestureRecognizer(gesture)
        }
    }

    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        print(sender.direction)
        
        var moved = false
        let oldBoard = board.gridworld
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.down:
            print("down swipe")
            board.mergeDown()
        case UISwipeGestureRecognizer.Direction.up:
            print("up swipe")
            board.mergeUp()
        case UISwipeGestureRecognizer.Direction.left:
            print("left swipe")
            board.mergeLeft()
        case UISwipeGestureRecognizer.Direction.right:
            print("right swipe")
            board.mergeRight()
        default:
            print("other swipe")
        }
        let newBoard = board.gridworld
        for row in 0..<4 {
            for col in 0..<4 {
                if oldBoard[row][col].value != newBoard[row][col].value {
                    moved = true
                }
            }
        }
        if moved {
            board.newSquare()
            scoreLabel.text = "Score: \(board.score)"
        }
        
        if board.maxValue == 2048 && !popUpDisplayed {
            let alert = UIAlertController(title: "Congratulations!", message: "You have reached 2048. Do you want to continue?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.restartGame()
            }))
            alert.addAction(UIAlertAction(title: "Continue", style: .cancel, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
            popUpDisplayed = true
        }
        if board.maxValue == 131072 {
            let alert = UIAlertController(title: "Congratulations!", message: "You have reached 131072!!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.restartGame()
            }))
            self.present(alert, animated: true, completion: nil)
        }
//        if moved == false{
//            for row in 0..<4 {
//                for col in 0..<4 {
//                    if board.gridworld[row][col].value != 0{
//                    occupiedSquare = occupiedSquare + 1
//                    }
//                }
//            }
//            if occupiedSquare == 16 {
//                let alert = UIAlertController(title: "Game Over", message: "You have reached 131072!!", preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
//                    self.restartGame()
//                }))
//                self.present(alert, animated: true, completion: nil)
//            }
//        }

        
        refreshView()
    }

    func refreshView() {
        
        square00.backgroundColor = board.gridworld[0][0].color
        (square00.subviews[0] as? UILabel)?.text = board.gridworld[0][0].value==0 ? "" : String(board.gridworld[0][0].value)
        
        square01.backgroundColor = board.gridworld[0][1].color
        (square01.subviews[0] as? UILabel)?.text =
            board.gridworld[0][1].value==0 ? "" :
            String(board.gridworld[0][1].value)
            
        square02.backgroundColor = board.gridworld[0][2].color
        (square02.subviews[0] as? UILabel)?.text =
            board.gridworld[0][2].value==0 ? "" :
            String(board.gridworld[0][2].value)
        
        square03.backgroundColor = board.gridworld[0][3].color
        (square03.subviews[0] as? UILabel)?.text =
            board.gridworld[0][3].value==0 ? "" :
            String(board.gridworld[0][3].value)
        
        square10.backgroundColor = board.gridworld[1][0].color
        (square10.subviews[0] as? UILabel)?.text =
            board.gridworld[1][0].value==0 ? "" :
            String(board.gridworld[1][0].value)
        
        square11.backgroundColor = board.gridworld[1][1].color
        (square11.subviews[0] as? UILabel)?.text =
            board.gridworld[1][1].value==0 ? "" :
            String(board.gridworld[1][1].value)
        
        square12.backgroundColor = board.gridworld[1][2].color
        (square12.subviews[0] as? UILabel)?.text =
            board.gridworld[1][2].value==0 ? "" :
            String(board.gridworld[1][2].value)
        
        square13.backgroundColor = board.gridworld[1][3].color
        (square13.subviews[0] as? UILabel)?.text =
            board.gridworld[1][3].value==0 ? "" :
            String(board.gridworld[1][3].value)
        
        square20.backgroundColor = board.gridworld[2][0].color
        (square20.subviews[0] as? UILabel)?.text =
            board.gridworld[2][0].value==0 ? "" :
            String(board.gridworld[2][0].value)
        
        square21.backgroundColor = board.gridworld[2][1].color
        (square21.subviews[0] as? UILabel)?.text =
            board.gridworld[2][1].value==0 ? "" :
            String(board.gridworld[2][1].value)
        
        square22.backgroundColor = board.gridworld[2][2].color
        (square22.subviews[0] as? UILabel)?.text =
            board.gridworld[2][2].value==0 ? "" :
            String(board.gridworld[2][2].value)
        
        square23.backgroundColor = board.gridworld[2][3].color
        (square23.subviews[0] as? UILabel)?.text =
            board.gridworld[2][3].value==0 ? "" :
            String(board.gridworld[2][3].value)
        
        square30.backgroundColor = board.gridworld[3][0].color
        (square30.subviews[0] as? UILabel)?.text =
            board.gridworld[3][0].value==0 ? "" :
            String(board.gridworld[3][0].value)
        
        square31.backgroundColor = board.gridworld[3][1].color
        (square31.subviews[0] as? UILabel)?.text =
            board.gridworld[3][1].value==0 ? "" :
            String(board.gridworld[3][1].value)
        
        square32.backgroundColor = board.gridworld[3][2].color
        (square32.subviews[0] as? UILabel)?.text =
            board.gridworld[3][2].value==0 ? "" :
            String(board.gridworld[3][2].value)
        
        square33.backgroundColor = board.gridworld[3][3].color
        (square33.subviews[0] as? UILabel)?.text =
            board.gridworld[3][3].value==0 ? "" :
            String(board.gridworld[3][3].value)
        view.layoutIfNeeded()
    }
    
    fileprivate func restartGame() {
        board = Board()
        board.newSquare()
        scoreLabel.text = "Score: 0"
        popUpDisplayed = false
        refreshView()
    }
}

