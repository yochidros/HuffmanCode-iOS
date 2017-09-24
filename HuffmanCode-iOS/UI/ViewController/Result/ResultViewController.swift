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
        let f = HuffmanCode.shared.huffmanData.huffmanFreq.sorted(by: { $0.1 < $0.1})
        var freq: [String: Int] = [:]
        f.forEach { (k,v) in
            freq[k] = v
        }
        collectionView.data = freq
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
