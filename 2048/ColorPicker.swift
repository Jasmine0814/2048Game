//
//  ColorPicker.swift
//  2048
//
//  Created by Yilin Zhao on 12/30/19.
//  Copyright © 2019 Yijia Zhao. All rights reserved.
//

import UIKit

class ColorPicker: NSObject {
    //dictionary & empty color.
    //input int output color.
    //declaration
    static let emptySquareColor = UIColor.gray
    static var squareColor = [
        2:UIColor.init(red: 0.7255, green: 0.9882, blue: 0, alpha: 1.0),/* #b9fc00 */
        4:UIColor.init(red: 0.3922, green: 0.949, blue: 0, alpha: 1.0),/* #64f200 */
        8:UIColor.init(red: 0.498, green: 0.8784, blue: 0, alpha: 1.0),/* #7fe000 */
        16:UIColor.init(red: 0, green: 0.898, blue: 0.749, alpha: 1.0),/* #00e5bf */
        32:UIColor.init(red: 0, green: 0.949, blue: 0.902, alpha: 1.0),/* #00f2e6 */
        64:UIColor.init(red: 0, green: 0.8863, blue: 0.9686, alpha: 1.0), /* #00e2f7 */
        128:UIColor.init(red: 0, green: 0.7412, blue: 0.9686, alpha: 1.0), /* #00bdf7 */
        256:UIColor.init(red: 0, green: 0.6549, blue: 0.9373, alpha: 1.0), /* #00a7ef */
        512:UIColor.init(red: 0, green: 0.6, blue: 0.8588, alpha: 1.0), /* #0099db */
        1024:UIColor.init(red: 0, green: 0.3176, blue: 0.7686, alpha: 1.0), /* #0051c4 */
        2048:UIColor.init(red: 0.0196, green: 0, blue: 0.698, alpha: 1.0), /* #0500b2 */
        4096:UIColor.init(red: 0.2078, green: 0, blue: 0.698, alpha: 1.0), /* #3500b2 */
        8192:UIColor.init(red: 0.4235, green: 0, blue: 0.7294, alpha: 1.0), /* #6c00ba */
        16384:UIColor.init(red: 0.6549, green: 0, blue: 0.7882, alpha: 1.0), /* #a700c9 */
        32768:UIColor.init(red: 0.8275, green: 0, blue: 0.6471, alpha: 1.0), /* #d300a5 */
        65536:UIColor.init(red: 0.8784, green: 0, blue: 0.5255, alpha: 1.0), /* #e00086 */
        131072:UIColor.init(red: 1, green: 0, blue: 0, alpha: 1.0), /* #ff0000 */
    ]
   
    static func getColor(value : Int) -> UIColor{
        return squareColor[value] ?? emptySquareColor
    }
}
