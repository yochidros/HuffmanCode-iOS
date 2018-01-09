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
        var invalidText: String = ""
        let encodeDatas = HuffmanModel.share.result
        let d = HuffmanModel.share.result
        d.keys.forEach({ keys.append($0) })
        var completeFlag = true
        textField.text?.characters.forEach({ (c) in
            if keys.contains(String(c)) {
                text += HuffmanModel.share.result[String(c)]!
            }else {
                invalidText += String(c)
                completeFlag = false
            }
        })
        
        resultLabel.text = completeFlag ? "\(encodeDatas)\n\(text)" : """
        ERROR:
        Can't encode from input string
        (invalid string is \(invalidText),
        it's not contain in previous Input datas.)
        """
    }
}
