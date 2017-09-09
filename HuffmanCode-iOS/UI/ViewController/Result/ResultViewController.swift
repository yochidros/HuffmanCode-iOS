//
//  ResultViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var collectionView: ResultCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Result"
        collectionView.contentsDelegate = self
        let d = HuffmanCode.shared.huffmanData.huffmanFreq.sorted(by: { $0.0 > $0.0})
        var ds: [String: Int] = [:]
        d.forEach { (k,v) in
            ds[k] = v
        }
        collectionView.data = ds
    }

}

extension ResultViewController: ContentsViewDelegate  {
    func contentsView(_ view: UICollectionViewCell, onEvent: ResultToolsEvent) {
        switch onEvent {
        case .image:
            self.transition(to: DestinationImageView())
        case .decode:
            self.transition(to: DestinationDecoderView())
        case .encode:
            self.transition(to: DestinationEncoderView())
        case .close:
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
