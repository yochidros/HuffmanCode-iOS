//
//  DestinationEncoderView.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit

class DestinationEncoderView: PushTransition {
    var src: UIViewController?
//    var data:[String:Int]?
    
//    init(data:[String:Int]){
//        self.data = data
//    }
    var dst: UIViewController? {
        let vc = EncoderViewController.instantiate()
//        vc.data = self.data ?? [:]
        return vc
    }
}
