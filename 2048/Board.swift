//
//  Board.swift
//  2048
//
//  Created by Yilin Zhao on 12/31/19.
//  Copyright © 2019 Yijia Zhao. All rights reserved.
//

import Foundation

class Board {
    
    var gridworld: [[Square]]
    var maxValue = 0
    var score = 0
//    var gridworld = [
//    [2,2,2,2],
//    [2,2,4,8],
//    [8,4,8,2],
//    [2,2,2,0]]
    
    init() {
        gridworld = Array(repeating: Array(repeating: Square(), count: 4), count: 4)
        for row in 0..<4 {
            for col in 0..<4 {
                gridworld[row][col] = Square()
            }
        }
    }

    struct Position {
        var col : Int
        var row : Int
    }
    
    func newSquare() {
        var emptySquareList = [Position]()
        for row in 0..<4 {
           for col in 0..<4 {
                if gridworld[row][col].value == 0 {
                    emptySquareList.append(Position(col: col, row: row))
                }
            }
        }
        
        if emptySquareList.count == 0  { return }
        
        let index = Int.random(in: 0..<emptySquareList.count)
        
        var randomValue : Int
        if Int.random(in: 0..<10) == 0 {
            randomValue = 4
        } else {
            randomValue = 2
        }
        gridworld[emptySquareList[index].row][emptySquareList[index].col].value = randomValue
        
        //print("\(emptySquareList[index].row) : \(emptySquareList[index].col) : \(randomValue)")
        
        if maxValue < randomValue {
            maxValue = randomValue
        }
    }
    
    func mergeLeft() {
        // [0,0,0,2],
        // [2,2,4,8],
        // [2,4,8,16]
        // [2,2,4,8],
        // [8,4,8,2]
        // [2,2,2,0]]
        // 4 0 0 2
        // 4 0 0 4
        // 0 2 0 2
         for row in 0..<4 {
             var readCol = 0
             var writeCol = 0
            
             while(readCol < 4) {
                 if gridworld[row][readCol] .value == 0 || readCol == writeCol{
                     readCol = readCol + 1
                 } else if gridworld[row][readCol].value == gridworld[row][writeCol].value {
                     score = score + gridworld[row][writeCol].value
                     gridworld[row][writeCol].value *= 2
                     gridworld[row][readCol].value = 0
                     if maxValue < gridworld[row][writeCol].value {
                         maxValue = gridworld[row][writeCol].value
                     }
                     readCol = readCol + 1
                     writeCol = writeCol + 1
                 } else if gridworld[row][writeCol].value == 0 {
                    gridworld[row][writeCol].value = gridworld[row][readCol].value
                    gridworld[row][readCol].value = 0
                    readCol = readCol + 1
                    //writeCol = writeCol + 1
                 } else {
                    writeCol = writeCol + 1
                }
             }
    }
    }

     //Right
     func mergeRight(){
         
       for row in 0..<4 {
            var readCol = 3
            var writeCol = 3
           
            while(readCol >= 0) {
                if gridworld[row][readCol] .value == 0 || readCol == writeCol{
                    readCol = readCol - 1

                } else if gridworld[row][readCol].value == gridworld[row][writeCol].value {
                    score = score + gridworld[row][writeCol].value
                    gridworld[row][writeCol].value *= 2
                    gridworld[row][readCol].value = 0
                    if maxValue < gridworld[row][writeCol].value {
                        maxValue = gridworld[row][writeCol].value
                    }
                    readCol = readCol - 1
                    writeCol = writeCol - 1
                } else if gridworld[row][writeCol].value == 0 {
                   gridworld[row][writeCol].value = gridworld[row][readCol].value
                   gridworld[row][readCol].value = 0
                   readCol = readCol - 1
                  // writeCol = writeCol - 1
                } else {
                   writeCol = writeCol - 1
               }
            }
            
        }
     }
     
    
     //Upwards
            // [0,0,0,2],
            // [2,2,4,8],
            // [2,4,8,16]
            // [2,2,4,8],
    func mergeUp() {
     
        for col in 0..<4 {
            var readRow = 0
            var writeRow = 0
           
            while(readRow < 4) {
                if gridworld[readRow][col] .value == 0 || readRow == writeRow{
                    readRow = readRow+1
                    
                } else if gridworld[readRow][col].value == gridworld[writeRow][col].value {
                    score = score + gridworld[writeRow][col].value
                    gridworld[writeRow][col].value *= 2
                    gridworld[readRow][col].value = 0
                    if maxValue < gridworld[writeRow][col].value {
                        maxValue = gridworld[writeRow][col].value
                    }
                    readRow = readRow + 1
                    writeRow = writeRow + 1
                    
                } else if gridworld[writeRow][col].value == 0{
                   gridworld[writeRow][col].value = gridworld[readRow][col].value
                   gridworld[readRow][col].value = 0
                   readRow = readRow + 1
                   //writeRow = writeRow + 1
                } else {
                   writeRow = writeRow + 1
               }
            }
        }

    }
     
     //Downwards
    func mergeDown() {
        for col in 0..<4 {
            var readRow = 3
            var writeRow = 3
         
            while(readRow >= 0) {
                if gridworld[readRow][col] .value == 0 || readRow == writeRow{
                    readRow = readRow - 1
    
                } else if gridworld[readRow][col].value == gridworld[writeRow][col].value {
                    score = score + gridworld[writeRow][col].value
                    gridworld[writeRow][col].value *= 2
                    gridworld[readRow][col].value = 0
                    if maxValue < gridworld[writeRow][col].value {
                        maxValue = gridworld[writeRow][col].value
                    }
                    readRow = readRow - 1
                    writeRow = writeRow - 1
                    
                } else if gridworld[writeRow][col].value == 0 {
                    gridworld[writeRow][col].value = gridworld[readRow][col].value
                    gridworld[readRow][col].value = 0
                    readRow = readRow - 1
                    //writeRow = writeRow - 1
                } else {
                    writeRow = writeRow - 1
                }
            }
        }
    }

}
