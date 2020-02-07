////
////  SquareMerger.swift
////  2048
////
////  Created by Yilin Zhao on 1/2/20.
////  Copyright © 2020 Yijia Zhao. All rights reserved.
////
//
//import Foundation
//
//enum Direction {
//    case right
//    case left
//    case up
//    case down
//}
//
//struct Position {
//    var col : Int
//    var row : Int
//}
//
//class SquareMerger {
//   // var gridworld = [[Int]]()
//    var gridworld = [
//    [2,2,2,2],
//    [2,2,4,8],
//    [8,4,8,2],
//    [2,2,2,0]]
//    
//    //Left
//    func moveToTheLeft() {
//        
//        dropLeft()
//        
//        //multiplication
//        for row in 0..<4 {
//            for col in 0..<3 {
//                if gridworld[row][col] == gridworld[row][col+1] {
//                    gridworld[row][col] *= 2
//                    gridworld[row][col+1] = 0
//                }
//            }
//        }
//    
//        //Move
//        dropLeft()
//        print(gridworld)
//    }
//    
//    //Right
//    func moveToTheRight() {
//        
//        dropRight()
//        
//        //multiplication
//        for row in (0..<4).reversed() {
//            for col in (1..<4).reversed() {
//                if gridworld[row][col] == gridworld[row][col-1] {
//                    gridworld[row][col] *= 2
//                    gridworld[row][col-1] = 0
//                }
//            }
//        }
//    
//        //Move
//        dropRight()
//        print(gridworld)
//    }
//    
//    //Upwards
//    func moveUp() {
//    
//        dropUp()
//        
//        //multiplication
//        for col in 0..<4 {
//            for row in 0..<3 {
//                if gridworld[row][col] == gridworld[row+1][col] {
//                    gridworld[row][col] *= 2
//                    gridworld[row+1][col] = 0
//                }
//            }
//        }
//   
//        //Move
//        dropUp()
//        print(gridworld)
//   }
//    
//    //Downwards
//    func moveDown() {
//        
//        dropDown()
//        
//        //multiplication
//        for col in (0..<4).reversed() {
//            for row in (1..<4).reversed() {
//                if gridworld[row][col] == gridworld[row-1][col] {
//                    gridworld[row][col] *= 2
//                    gridworld[row-1][col] = 0
//                }
//            }
//        }
//    
//        //Move
//        dropDown()
//        print(gridworld)
//    }
//    
//    func dropDown() {
//        for col in (0..<4).reversed() {
//            for row in (1..<4).reversed() {
//                if gridworld[row][col] == 0 {
//                    gridworld[row][col] = gridworld[row-1][col]
//                    gridworld[row-1][col] = 0
//                }
//            }
//        }
//    }
//    func dropUp() {
//        for col in 0..<4 {
//            for row in 0..<3 {
//                if gridworld[row][col] == 0 {
//                    gridworld[row][col] = gridworld[row+1][col]
//                    gridworld[row+1][col] = 0
//                }
//            }
//        }
//    }
//    func dropLeft() {
//        for row in 0..<4 {
//            for col in 0..<3 {
//                if gridworld[row][col] == 0 {
//                    gridworld[row][col] = gridworld[row][col+1]
//                    gridworld[row][col+1] = 0
//                }
//            }
//        }
//    }
//    func dropRight() {
//        for row in (0..<4).reversed() {
//            for col in (1..<4).reversed() {
//                if gridworld[row][col] == 0 {
//                    gridworld[row][col] = gridworld[row][col-1]
//                    gridworld[row][col-1] = 0
//                }
//            }
//        }
//    }
//
//}
//
