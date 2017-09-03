//
//  InputDatasViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

class InputDatasViewController: UIViewController {
    @IBOutlet weak var collectionView: InputDatasCollectionView!
    
    var characterCount: Int = 0 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Input Datas"
        collectionView.charactersCount = self.characterCount
        collectionView.actionDelegate = self
    }
    
}

extension InputDatasViewController: InputDatasView {
    func inputDatasView(_ view: UICollectionViewCell, datas: [String : Int]) {
        print(datas)
        self.transition(to: DestinationResultView(data: datas))
    }
}




