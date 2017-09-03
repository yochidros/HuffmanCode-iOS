//
//  Transition.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit

protocol Transition: class {
    var src: UIViewController? { get set }
    func execute()
}

protocol PushTransition: Transition {
    var dst: UIViewController? { get }
}

protocol  PresentTransition: Transition {
    var dst: UIViewController? { get }
}

extension PushTransition{
    func execute() {
        if let nav = src?.navigationController, let dst = dst {
            nav.pushViewController(dst, animated: true)
        }
    }
}

extension PresentTransition{
    func execute() {
        if let src = (src?.navigationController ?? src), let dst = dst{
            src.present(dst, animated: true, completion: nil)
        }
    }
}
