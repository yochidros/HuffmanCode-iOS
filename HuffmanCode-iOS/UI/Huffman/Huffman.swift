//
//  Huffman.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation

struct HuffmanModel {
    var huffmanEncode: [String:String] = [:]
    var huffmanFreq: [String: Int] = [:]
    var decodeText: String = ""
}

class HuffmanCode {
    static var shared = HuffmanCode()
    var huffmanData = HuffmanModel()
    var a: [String: Any] = [:]
    enum HuffmanTree<T> {
        case Leaf(T)
        indirect case Node(HuffmanTree<T>, HuffmanTree<T>)
        
        func printCodes(prefix: String = ""){
            switch(self) {
            case let .Leaf(c):
                let s = c as! String
                HuffmanCode.shared.huffmanData.huffmanEncode[s] = prefix
            case let .Node(l, r):
                l.printCodes(prefix:  prefix + "0")
                r.printCodes(prefix:  prefix + "1")
            }
        }
        

        func decode(string: String){
            self.printCodes()
            var rev_enc :[String: String] = [:]
            HuffmanCode.shared.huffmanData.huffmanEncode.forEach { (k,v) in
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
            HuffmanCode.shared.huffmanData.decodeText = decoded
        }

    }

    func buildTree<T>(freqs: [T : Int]) -> HuffmanTree<T> {
        HuffmanCode.shared.huffmanData.huffmanFreq = freqs as! [String: Int]
        
        HuffmanCode.shared.huffmanData.huffmanEncode.removeAll()
        assert(freqs.count > 0, "must contain at least one character")
        // leaves sorted by increasing frequency
        let leaves : [(Int, HuffmanTree<T>)] = freqs.sorted { (p1, p2) in p1.1 < p2.1 }.map { (x, w) in
            print(w) ; return (w, .Leaf(x)) }
        // nodes sorted by increasing frequency
        var nodes = [(Int, HuffmanTree<T>)]()
        var tree: HuffmanTree<T>? = nil
        // iterate through leaves and nodes in order of increasing frequency
        var i = 0 ; var j = 0
        while(true){
            assert(i < leaves.count || j < nodes.count)
            // get subtree of least frequency
            var e1 : (Int, HuffmanTree<T>)
            if j == nodes.count || i < leaves.count && leaves[i].0 < nodes[j].0 {
                e1 = leaves[i]
                i = i + 1
            } else {
                e1 = nodes[j]
                j = j + 1
            }
            
            // if there's no subtrees left, then that one was the answer
            if i == leaves.count && j == nodes.count {
                tree = e1.1
                break
            }
            
            // get next subtree of least frequency
            var e2 : (Int, HuffmanTree<T>)
            if j == nodes.count || i < leaves.count && leaves[i].0 < nodes[j].0 {
                e2 = leaves[i]
                i = i + 1
            } else {
                e2 = nodes[j]
                j = j + 1
            }
            // create node from two subtrees
            
            nodes.append((e1.0 + e2.0, .Node(e1.1, e2.1)))
        }
        return tree!
    }
    
    //    func getFreqs<S : Sequence>(seq: S) -> [(S.Iterator.Element, Int)] where S.Iterator.Element : Hashable {
    //        var freqs : [S.Iterator.Element : Int] = [:]
    //        for c in seq {
    //            freqs[c] = (freqs[c] ?? 0) + 1
    //        }
    //        return Array(freqs)
    //    }
    
}
