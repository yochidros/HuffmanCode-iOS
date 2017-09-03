//
//  InputDatasAction.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import UIKit


protocol InputDatasCellDelegate: class {
    func cellDidSelectCalcurate(_ view: UICollectionViewCell, datas: [String: Int])
}

protocol InputDatasView: class {
    func inputDatasView(_ view: UICollectionViewCell, datas: [String : Int])
}
