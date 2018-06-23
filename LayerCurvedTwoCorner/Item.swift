//
//  Item.swift
//  LayerCurvedTwoCorner
//
//  Created by HP on 6/23/18.
//  Copyright © 2018 rth. All rights reserved.
//

import UIKit

struct Item{
    let backgroundColor : UIColor?
    let labelColor: UIColor?
    let textColor: UIColor?
    let content: String?
    
    init(backgroundColor: UIColor?, labelColor: UIColor?, textColor: UIColor?, content: String?) {
        self.backgroundColor = backgroundColor
        self.labelColor = labelColor
        self.textColor = textColor
        self.content = content
    }
}
