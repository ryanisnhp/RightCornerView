//
//  CornerCell.swift
//  LayerCurvedTwoCorner
//
//  Created by HP on 6/23/18.
//  Copyright © 2018 rth. All rights reserved.
//

import UIKit

class CornerCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    var item: Item!{
        didSet{
            let width : CGFloat = mainView.frame.width - 40.0
            let height: CGFloat = mainView.frame.height - 20.0
            let rect = CGRect(x: mainView.frame.midX - width / 2, y: mainView.frame.midY - height / 2, width: width, height: height)
            let cView = CView(frame: rect, image: nil, content: item.content!, cornerRadius: 40.0, baseFontSize: 18.0, labelColor: item.labelColor)
            cView.backgroundColor = item.backgroundColor
            mainView.addSubview(cView)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(rgb: 0xf9bf8f)
        mainView.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
