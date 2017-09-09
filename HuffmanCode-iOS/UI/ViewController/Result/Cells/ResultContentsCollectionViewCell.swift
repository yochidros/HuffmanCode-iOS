//
//  ResultContentsCollectionViewCell.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/03.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

class ResultContentsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var huffmanCodeLabel: UILabel!
    @IBOutlet weak var frequecyLabel: UILabel!
    @IBOutlet weak var characterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(datas:(char: String, freq: Int, code: String)){
        characterLabel.text = datas.char
        frequecyLabel.text = String(datas.freq)
        huffmanCodeLabel.text = datas.code
    }
}
