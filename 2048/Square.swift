//
//  Square.swift
//  2048
//
//  Created by Yilin Zhao on 12/31/19.
//  Copyright © 2019 Yijia Zhao. All rights reserved.
//

import Foundation
import UIKit

struct Square {

    var value = 0 {
        didSet {
            self.color = ColorPicker.getColor(value: value)
        }
    }
    var color: UIColor
    
    init(value : Int = 0) {
        self.value = value
        self.color = ColorPicker.getColor(value: value)
    }
    
//    func getValue() -> Int {
//        return value
//    }
    
//    func multiplication() -> Int {
//        value = value * 2
//        return value
//    }
    
    //func getcolor(value:Int) -> UIColor {
    //    return squareColor[value] ?? emptySquareColor
    //}
}
