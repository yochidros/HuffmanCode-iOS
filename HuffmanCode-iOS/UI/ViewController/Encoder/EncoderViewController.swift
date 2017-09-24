//
//  EncoderViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

class EncoderViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Encode"
    }

    @IBAction func didSelectEncode(_ sender: Any) {
        var keys: [String] = []
        var text: String = ""
        let encodeDatas = Huffman3.share.result
        let d = Huffman3.share.result
        d.keys.forEach { (key) in
            keys.append(key)
        }
        var completeFlag = true
        textField.text?.characters.forEach({ (c) in
            if keys.contains(String(c)) {
                text += Huffman3.share.result[String(c)]!
//                text = text + HuffmanCode.shared.huffmanData.huffmanEncode[String(c)]!
            }else {
                completeFlag = false
            }
        })
//        text = Huffman3.share.encode(text: textField.text!)
        resultLabel.text = completeFlag ? "\(encodeDatas)\n\(text)" : "ERROR: Can't encode from input string"
    }
}
