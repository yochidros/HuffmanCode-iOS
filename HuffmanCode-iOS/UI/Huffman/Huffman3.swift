//
//  Huffman3.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/24.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation


class Huffman3 {
    static var share = Huffman3()
    var freq: [String: Int] = [:]
    var result: [String: String] = [:]
    var tree = Dictionary<String, Any>()
    
    func huffman_code(freq: [String: Int]){
        Huffman3.share.freq = freq
        var vals: [String: Int] = freq
        var nodes = Dictionary<String, Any>()
        
        for n in vals.keys{
            nodes[n] = []
        }
        var root = ""
        while vals.count > 1 {
            let sort_vals = vals.sorted{ $0.1 < $1.1 }
            var a1: (key: String, value: Int) = ("",0)
            var a2: (key: String, value: Int) = ("",0)
            var i = 0
            for v in sort_vals {
                if i == 2 { break }
                if i == 0 {
                    a1 = v
                }else if i == 1 {
                    a2 = v
                }
                i += 1
            }
            vals[a1.key + a2.key] = (vals[a1.key] as! Int) + (vals[a2.key] as! Int)
            vals.removeValue(forKey: a1.key)
            vals.removeValue(forKey: a2.key)
            nodes[a1.key + a2.key] = [a1.key, a2.key]
            root = a1.key + a2.key
        }
        if vals.count == 1 {
            freq.forEach({ (k,v) in
                Huffman3.share.result[k] = "0"
            })
            return
        }
        _ = assign_code(nodes: nodes, label: root, result: [:])
       
    }
  
    private func assign_code(nodes: Dictionary<String, Any> , label: String, result: [String: String], prefix: String = "") -> String{
        let childs : [String] = nodes[label] as! [String]
        var tree = Dictionary<String,Any>()
        if childs.count == 2{
            tree["0"] = assign_code(nodes: nodes, label: childs[0], result: result, prefix: prefix + "0")
            tree["1"] = assign_code(nodes: nodes, label: childs[1], result: result, prefix: prefix + "1")
            Huffman3.share.tree = tree
            return ""
        }else {
            Huffman3.share.result[label] = prefix
            return label
        }
    }
    
    func encode(text: String) -> String{
        var res = ""
        text.forEach { (c) in
            res += Huffman3.share.result["\(c)"]!
        }
        return res
    }
    
    func decode(string: String) -> String{
        var rev_enc :[String: String] = [:]
        Huffman3.share.result.forEach { (k,v) in
            rev_enc[v] = k
        }
        var decoded = ""
        var pos = 0
        var s:[String] = []
        string.characters.forEach { (c) in
            s.append(String(c))
        }
        while(pos < string.characters.count) {
            var key = ""
            while(!(rev_enc.keys.contains(key))){
                if pos == s.count { break }
                key += s[pos]
                pos += 1
            }
            if rev_enc.keys.contains(key) {
                decoded += rev_enc[key] ?? ""
            }
        }
        return decoded
    }
    
}
