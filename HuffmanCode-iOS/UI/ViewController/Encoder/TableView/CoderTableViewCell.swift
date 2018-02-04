//
//  CoderTableViewCell.swift
//  HuffmanCode-iOS
//
//  Created by Yoshiki Miyazawa on 2018/01/09.
//  Copyright © 2018年 yochio. All rights reserved.
//

import UIKit

class CoderTableViewCell: UITableViewCell {
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    func configureCell(text: String) {
        let a = text.split(separator: ":").map { String($0) }
        keyLabel.text = a[0]
        valueLabel.text = a[1]
    }
}
