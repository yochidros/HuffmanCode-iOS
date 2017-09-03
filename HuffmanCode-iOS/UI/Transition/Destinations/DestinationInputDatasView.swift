//
//  DestinationInputDatasView.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit

class DestinationInputDatasView: PushTransition {
    var src: UIViewController?
    var count: Int?
    
    init(count: Int?){
        self.count = count
    }
    
    var dst: UIViewController? {
        let vc = InputDatasViewController.instantiate()
        vc.characterCount = self.count ?? 0
        return vc
    }
}
