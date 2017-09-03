//
//  Button.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit

final class Button: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            update()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            isHighlighted ? (self.alpha = 2.0) : (self.alpha = 1.0)
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup(){
        self.clipsToBounds = true
    }
    
    private func update(){
        self.layer.cornerRadius = cornerRadius
    }
    
}
