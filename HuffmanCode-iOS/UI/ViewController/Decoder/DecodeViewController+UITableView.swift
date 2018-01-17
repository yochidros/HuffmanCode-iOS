//
//  DecodeViewController+UITableView.swift
//  HuffmanCode-iOS
//
//  Created by Yoshiki Miyazawa on 2018/01/17.
//  Copyright © 2018年 yochio. All rights reserved.
//

import UIKit

extension DecoderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
}

extension DecoderViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cell = cell as? CoderTableViewCell {
            cell.configureCell(text: self.tableData[indexPath.row])
        }
        return cell
    }
    
    
}
