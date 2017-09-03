//
//  DecoderViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

class DecoderViewController: UIViewController {
    var huffmanData: HuffmanCode?
    var data: [String: Int]?
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didSelectDecode(_ sender: Any) {
        guard let text = textField.text else { return }
        decodeText = ""
        huffmanData?.buildTree(freqs: data ?? [:]).decode(string: text)
        self.resultLabel.text = decodeText
    }
}
