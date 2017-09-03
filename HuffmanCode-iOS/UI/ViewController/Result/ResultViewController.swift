//
//  ResultViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var data : [String: Int]? {
        didSet {
            huffmanCode.buildTree(freqs: data ?? [:]).printCodes()
        }
    }
    @IBOutlet weak var collectionView: ResultCollectionView!
    var huffmanCode: HuffmanCode = HuffmanCode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Result"
        collectionView.data = data ?? [:]
        collectionView.huffman = self.huffmanCode
        collectionView.contentsDelegate = self
    }

}

extension ResultViewController: ContentsViewDelegate  {
    func contentsView(_ view: UICollectionViewCell, onEvent: ResultToolsEvent) {
        switch onEvent {
        case .image:
            self.transition(to: DestinationImageView())
        case .decode:
            self.transition(to: DestinationDecoderView(huffmanData: self.huffmanCode, data: self.data ?? [:]))
        case .encode:
            self.transition(to: DestinationEncoderView())
        case .close:
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}
