//
//  UIViewControllerExtension.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        return self.init(nibName: className, bundle: nil)
    }
}

extension UIViewController {
    func transition(to: Transition){
        to.src = self
        to.execute()
    }
}
