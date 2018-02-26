/*
 Copyright © 23/04/2016 Shaps
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

import UIKit

extension UILabel {
    
    public override func preparePeek(with coordinator: Coordinator) {
        super.preparePeek(with: coordinator)
        
        coordinator.appendDynamic(keyPaths: [
            "adjustsFontSizeToFitWidth",
            "minimumScaleFactor",
        ], forModel: self, in: .behaviour)
        
        coordinator.appendDynamic(keyPaths: ["preferredMaxLayoutWidth"], forModel: self, in: .layout)
        
        coordinator.appendTransformed(keyPaths: ["lineBreakMode"], valueTransformer: { value in
            guard let rawValue = value as? Int, let lineBreakMode = NSLineBreakMode(rawValue: rawValue) else { return nil }
            return lineBreakMode.description
        }, forModel: self, in: .behaviour)
        
        coordinator.appendTransformed(keyPaths: ["textAlignment"], valueTransformer: { value in
            guard let rawValue = value as? Int, let textAlignment = NSTextAlignment(rawValue: rawValue) else { return nil }
            return textAlignment.description
        }, forModel: self, in: .appearance)
        
        coordinator.appendDynamic(keyPaths: [
            "text",
            "attributedText",
            "textColor",
            "highlightedTextColor",
            "font",
            "numberOfLines"
        ], forModel: self, in: .appearance)
        
        coordinator.appendDynamic(keyPaths: [
            "enabled",
            "highlighted"
        ], forModel: self, in: .states)
        
        coordinator.appendDynamic(keyPaths: [
            "shadowColor",
            "shadowOffset"
        ], forModel: self, in: .shadow)
    }
    
}
