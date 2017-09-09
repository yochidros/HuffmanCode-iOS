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
        if checkBinaryCode(text: text) {
            HuffmanCode.shared.buildTree(freqs: HuffmanCode.shared.huffmanData.huffmanFreq).decode(string: text)
            resultLabel.text = HuffmanCode.shared.huffmanData.decodeText
        }else {
            resultLabel.text = "ERROR: It's contain character code!!\n Please input binary code!!"
        }
    }
    
    private func checkBinaryCode(text: String) -> Bool{
        var flag = true
        text.characters.forEach { (c) in
            if c == "1" || c == "0" {
            }else { flag = false }
        }
        return flag
    }
}
