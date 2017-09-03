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
////    var hummanTree: HuffmanCode?
//    var data: [String: Int] = [ : ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Encode"
    }

    @IBAction func didSelectEncode(_ sender: Any) {
//        hummanTree = HuffmanCode()
//        hummanTree?.buildTree(freqs: data).printCodes()
        
        var keys: [String] = []
        var text: String = ""
        HuffmanEncode.keys.forEach { (key) in
            keys.append(key)
        }
        textField.text?.characters.forEach({ (c) in
            if keys.contains(String(c)) {
                text = text + HuffmanEncode[String(c)]!
            }
        })
        resultLabel.text = "\(HuffmanEncode)\n\(text)"
    }
}
