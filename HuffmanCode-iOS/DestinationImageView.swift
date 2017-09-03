//
//  DestinationImageView.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit

class DestinationImageView: PushTransition {
    var src: UIViewController?
    var dst: UIViewController? {
        let vc = ImageViewController.instantiate()
        return vc 
    }
}
