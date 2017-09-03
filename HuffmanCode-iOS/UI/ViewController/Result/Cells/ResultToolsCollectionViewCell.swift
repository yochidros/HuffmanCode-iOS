//
//  ResultToolsCollectionViewCell.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/03.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit



protocol ResultToolsViewDelegate: class {
    func toolsView(_ view: UICollectionViewCell, onEvent: ResultToolsEvent)
}
enum ResultToolsEvent{
    case image
    case decode
    case encode
    case close
}

class ResultToolsCollectionViewCell: UICollectionViewCell {
    weak var toolsDelegate: ResultToolsViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func didSelectShowImage(){
        toolsDelegate?.toolsView(self, onEvent: .image)
    }
    
    @IBAction func didSelectDecode(){
        toolsDelegate?.toolsView(self, onEvent: .decode)

    }
    
    @IBAction func didSelectEncode(){
        toolsDelegate?.toolsView(self, onEvent: .encode)

    }
    
    @IBAction func didSelectClose(){
        toolsDelegate?.toolsView(self, onEvent: .close)

    }
}
