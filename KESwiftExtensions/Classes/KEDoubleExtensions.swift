//
//  KEDoubleExtensions.swift
//  KESwiftExtensions
//
//  Created by Kais Ebraheem on 2020-06-13.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import Foundation

let DOUBLE_COMPARE_TOLERENCE:Double = 1.0E-9

public extension Double {
    
    /// Rounds the double to decimal places value
    mutating func roundToPlaces(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        //In Swift 3, rounded() is an instance method
        return (self * divisor).rounded() / divisor
    }
    
    //return a formated string representation
    func toStringWithFormat(_ format:String) -> String {
        return self.isNaN ? "NaN" : NSString(format: format as NSString, self) as String   /*"%.5e" */
    }
    
    func toStringInScientificNotation(_ digits:Int) -> String {
        let format = "%.\(digits)E"
        return self.isNaN ? "NaN" : NSString(format: format as NSString, self) as String
    }

    func beatifyOutput(digits:Int, leadingCutoff:Int = 3) -> String
    {
        func PAD(_ spaces:Int, char:String = " ") -> String
        {
            if spaces <= 0 { return "" }
            let _char = Character(char)
            let padded = String(repeating: String(_char), count: spaces)
            
            return  padded
        }
        var d:Double = self
        let totalChars = 1 + leadingCutoff + 1 + digits + 4
        let negative:Bool = self < 0.0
        var sD = "\(self)"
        var startPos:Int?, endPos:Int?
        (startPos, endPos) = sD.indexOf(".")
        let leftPad:Int = negative ? 0 : 1
        if startPos! > leadingCutoff {
            //force scientific notation
            sD = "\(self.toStringInScientificNotation(digits))"
            return "\(PAD(leftPad + leadingCutoff - 1))\(sD)\(PAD(totalChars - leftPad - sD.count))"
        }
        sD = "\(d.roundToPlaces(digits))"
        let filled = "\(PAD(leftPad + leadingCutoff - startPos!))\(sD)"
        return  "\(filled)\(PAD(totalChars - filled.count))"
    }
    
    func isNaN() -> Bool
    {
        return self.isInfinite && !self.isFinite
    }
    
    func isEqualToZero() -> Bool
    {
        return abs(self) <= DOUBLE_COMPARE_TOLERENCE || self.isZero
    }
    
    func isEqualTo(_ x:Double) -> Bool
    {
        return abs(self - x) <= DOUBLE_COMPARE_TOLERENCE
    }
    
    fileprivate func PAD(_ spaces:Int, char:String = " ") -> String
    {
        if spaces <= 0 { return "" }
        let _char = Character(char)
        let padded = String(repeating: String(_char), count: spaces)
        
        return  padded
    }

}

