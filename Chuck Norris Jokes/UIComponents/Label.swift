//
//  Label.swift
//  Chuck Norris Jokes
//
//  Created by Animesh Kumar on 14/04/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class Label: UILabel {
    
    init(frame: CGRect, content: String, size: CGFloat, alignment: NSTextAlignment, fontWeight: UIFont.Weight, color: UIColor) {
        super.init(frame: frame)
        configLabel(content: content, size: size, alignment: alignment, fontWeight: fontWeight, color: color)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configLabel(content: String, size: CGFloat, alignment: NSTextAlignment, fontWeight: UIFont.Weight, color: UIColor) -> Void {
        text                = content
        numberOfLines       = 0
        textColor           = color
        font                = .systemFont(ofSize: size, weight: fontWeight)
        textAlignment       = alignment
    }
}
