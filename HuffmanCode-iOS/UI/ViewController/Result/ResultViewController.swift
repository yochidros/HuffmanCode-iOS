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
        let f = HuffmanModel.share.frequency.sorted{ $0.0 < $1.0 }
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
            let alert = UIAlertController(
                title: "Back to the top page?",
                message: "If go back top view, the inputed data will be lost!!",
                preferredStyle: .alert)
            let action = UIAlertAction(title: "OK",
                                       style: .default,
                                       handler: { [weak self] _ in
                self?.navigationController?.popToRootViewController(animated: true)
            })
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(action)
            alert.addAction(cancel)
            
            self.present(alert, animated: true, completion: nil)
        }
    }
}
