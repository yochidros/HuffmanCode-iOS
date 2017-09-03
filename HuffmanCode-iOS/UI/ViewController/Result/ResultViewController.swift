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
    var huffmanCode: HuffmanCode = HuffmanCode()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Result"
    }

    @IBAction func didSelectShowImage(_ sender: Any) {
        self.transition(to: DestinationEncoderView())
    }
    @IBAction func didSelectClose(_ sender: Any) {
        self.transition(to: DestinationDecoderView(huffmanData: self.huffmanCode, data: self.data ?? [:]))
    }
}
