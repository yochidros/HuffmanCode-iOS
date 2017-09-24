//
//  InputDatasViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit
import Alamofire

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
        HuffmanCode().buildTree(freqs: datas).printCodes()
        let h = Huffman3()
        print(h.huffman_code(freq: datas))
        let param = [ "data" : datas ]
        let url = "http://localhost:8000/huffman"
        print(param)
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).responseJSON { (res) in
            print(res.response)
            print(res.result)
            if let json = res.value {
                print(json)
            }
        }
        
        self.transition(to: DestinationResultView())
    }
}




