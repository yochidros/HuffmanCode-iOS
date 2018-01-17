//
//  DecoderViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

class DecoderViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!

    var tableData: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(nibName: "CoderTableViewCell", bundle: nil),
            forCellReuseIdentifier: "cell"
        )
        tableView.dataSource = self
        tableView.delegate = self
        
        HuffmanModel.share.result.forEach { (key, value) in
            tableData.append("\(key):\(value)")
        }
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func didSelectDecode(_ sender: Any) {
        guard let text = textField.text else { return }
        if checkBinaryCode(text: text) {
            resultLabel.text =  HuffmanViewModel().decode(string: text)
        }else {
            resultLabel.text = """
            ERROR: It's contain character code!!
            Please input binary code!!
            Example: 1011
            """
        }
    }
    
    private func checkBinaryCode(text: String) -> Bool{
        var flag = true
        text.characters.forEach { (c) in
            if c == "1" || c == "0" {
            } else { flag = false }
        }
        return flag
    }
}
