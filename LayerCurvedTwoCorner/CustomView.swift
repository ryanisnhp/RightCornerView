//
//  CustomView.swift
//  LayerCurvedTwoCorner
//
//  Created by HP on 6/23/18.
//  Copyright © 2018 rth. All rights reserved.
//

import UIKit

class CView: UIView{
    var image: UIImage?
    var content: String?
    var contentWidth : CGFloat = 100.0
    var contentHeight : CGFloat = 40.0
    
    var priceView = UIView()
    var cornerRadius: CGFloat = 0.0
    let MINIMUN_LENGTH = 4
    
    init(frame: CGRect, image: UIImage?, content: String?, cornerRadius: CGFloat, baseFontSize: CGFloat, labelColor: UIColor?) {
        super.init(frame: frame)
        contentWidth = baseFontSize * CGFloat(content!.count) + 2 * cornerRadius
        if contentWidth >= 0.75 * frame.width{
            contentWidth = 0.75 * frame.width
        }
        
        let contentX = frame.width - CGFloat(contentWidth)
        let priceRect = CGRect(x: contentX, y: 0.0, width: contentWidth, height: contentHeight)
        var priceCornerRadius = (cornerRadius / self.frame.width) * CGFloat(contentWidth)
        if priceCornerRadius >= contentHeight / 2{
            priceCornerRadius = contentHeight / 2
        }
        priceView = Round2CornerView(frame: priceRect, cornerRadius: priceCornerRadius, content: content!, baseFontSize: baseFontSize)
        priceView.backgroundColor = labelColor
        self.addSubview(priceView)
        
        self.image = image
        self.content = content
        self.cornerRadius = cornerRadius
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}

class Round2CornerView: UIView{
    var cornerRadius: CGFloat = 0.0
    let MINIMUN_FONT_SIZE : CGFloat = 12.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, cornerRadius: CGFloat, content: String, baseFontSize: CGFloat) {
        super.init(frame: frame)
        let rect = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        let maxCharacterCanHas = (frame.width - 2 * cornerRadius) / baseFontSize + 0.5
        let label = UILabel(frame: rect)
        label.text = content
        if content.count > Int(maxCharacterCanHas){
            let newFont = (frame.width - 2 * cornerRadius) / CGFloat(content.count)
            if newFont <= MINIMUN_FONT_SIZE{
                let maxChar = Int((frame.width - 2 * cornerRadius) / MINIMUN_FONT_SIZE)
                label.text = content.prefix(maxChar) + "..."
                label.font = UIFont.systemFont(ofSize: MINIMUN_FONT_SIZE, weight: .bold)
            }else{
                label.font = UIFont.systemFont(ofSize: newFont, weight: .bold)
            }
        }else{
            label.font = UIFont.systemFont(ofSize: baseFontSize, weight: .bold)
        }
        label.textAlignment = .center
        label.textColor = .white
        self.cornerRadius = cornerRadius
        self.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = [.layerMinXMaxYCorner]
    }
}
