//
//  DestinationDecoderView.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/03.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit

class DestinationDecoderView: PushTransition {
    var src: UIViewController?
    var dst: UIViewController? {
        let vc = DecoderViewController.instantiate()
        return vc
    }
}
