//
//  KEStringExtensions.swift
//  KESwiftExtensions
//
//  Created by Kais Ebraheem on 2020-06-13.
//

import Foundation


//Swift 2.x
extension String {
    public func indexOfCharacter(_ char: Character) -> Int? {
        if let idx = self.firstIndex(of: char) {
            return self.distance(from: self.startIndex, to: idx)
        }
        return nil
    }
    
    func padding(_ length: Int) -> String {
        return self.padding(toLength: length, withPad: " ", startingAt: 0)
    }
    
    func padding(_ length: Int, paddingString: String) -> String {
        return self.padding(toLength: length, withPad: paddingString, startingAt: 0)
    }
    
    public func indexOf (_ substring:String) -> (startPos:Int?, endPos:Int?) {
        
        if let range = self.range(of: substring ) {
            let startPos = self.distance(from: self.startIndex, to: range.lowerBound)
            let endPos = self.distance(from: self.startIndex, to: range.upperBound)
            return (startPos, endPos)
        }
        
        return (nil, nil)
    }
    
    public func justifyWithin(_ width:Int) ->String
    {
        let sc:String = self
        let leftPad:Int = Int((width - sc.count)/2)
        let retStr = "\(PAD(leftPad))\(sc)\(PAD(width - leftPad - sc.count))"

        return retStr
    }
    
    fileprivate func PAD(_ nChars:Int, char:String = " ") -> String
    {
        if nChars <= 0 { return "" }
        let _char = Character(char)
        let padded = String(repeating: String(_char), count: nChars)
        
        return  padded
    }

    func isNumber() -> Bool {
        let nonDecimalCharacters = NSCharacterSet.decimalDigits.inverted
        return  (self.rangeOfCharacter(from: nonDecimalCharacters) == nil)
    }
    
    // ---------------------------------------------------------------------------
    // Updated for Swift 3.x, original code from:
    // http://samwize.com/2016/05/24/nsattributedstring-html-ios-unicode-encoding/
    // ---------------------------------------------------------------------------
    // Usage:
    // label.attributedText = "<b>Hello</b> \u{2022} World".htmlAttributedString()
    // ---------------------------------------------------------------------------
    
    func htmlAttributedString() -> NSAttributedString? {
        guard let data = self.data(using: String.Encoding.utf16, allowLossyConversion: false) else { return nil }
        guard let html = try? NSMutableAttributedString(
            data: data,
            options: convertToNSAttributedStringDocumentReadingOptionKeyDictionary([convertFromNSAttributedStringDocumentAttributeKey(NSAttributedString.DocumentAttributeKey.documentType): convertFromNSAttributedStringDocumentType(NSAttributedString.DocumentType.html)]),
            documentAttributes: nil) else { return nil }
        return html
    }
    
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToNSAttributedStringDocumentReadingOptionKeyDictionary(_ input: [String: Any]) -> [NSAttributedString.DocumentReadingOptionKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.DocumentReadingOptionKey(rawValue: key), value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringDocumentAttributeKey(_ input: NSAttributedString.DocumentAttributeKey) -> String {
    return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromNSAttributedStringDocumentType(_ input: NSAttributedString.DocumentType) -> String {
    return input.rawValue
}
