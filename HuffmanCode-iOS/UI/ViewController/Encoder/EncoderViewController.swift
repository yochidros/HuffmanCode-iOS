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

    @IBOutlet weak var tableView: UITableView!
    var tableData: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Encode"
        tableView.register(
            UINib(nibName: "CoderTableViewCell", bundle: nil),
            forCellReuseIdentifier: "cell"
        )
        tableView.dataSource = self
        tableView.delegate = self
        
        HuffmanModel.share.result.sorted { $0.0 < $1.0 }.forEach { (key, value) in
            tableData.append("\(key):\(value)")
        }
        tableView.tableFooterView = UIView()
    }

    @IBAction func didSelectEncode(_ sender: Any) {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        }
        
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
        if !completeFlag {
            resultLabel.text = """
            ERROR:
            Can't encode from input string
            (invalid string is \(invalidText),
            it's not contain in previous Input datas.)
            """
            return
        }
        resultLabel.text = "\(text)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        }
    }
}
