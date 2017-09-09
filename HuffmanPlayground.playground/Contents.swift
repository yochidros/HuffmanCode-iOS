//: Playground - noun: a place where people can play

import UIKit

enum HuffmanTree<T> {
    case Leaf(T)
    indirect case Node(HuffmanTree<T>, HuffmanTree<T>)
    
    func printCodes(prefix: String) {
        switch(self) {
        case let .Leaf(c):
            print("\(c)\t\(prefix)")
        case let .Node(l, r):
            l.printCodes(prefix: prefix + "0")
            r.printCodes(prefix: prefix + "1")
        }
    }
}

func buildTree<T>(freqs: [(T, Int)]) -> HuffmanTree<T> {
    assert(freqs.count > 0, "must contain at least one character")
    // leaves sorted by increasing frequency
    let leaves : [(Int, HuffmanTree<T>)] = freqs.sorted { (p1, p2) in p1.1 < p2.1 }.map { (x, w) in (w, .Leaf(x)) }
    // nodes sorted by increasing frequency
    var nodes = [(Int, HuffmanTree<T>)]()
    // iterate through leaves and nodes in order of increasing frequency
    var i = 0
    var j = 0
    while(true){
        assert(i < leaves.count || j < nodes.count)
        // get subtree of least frequency
        var e1 : (Int, HuffmanTree<T>)
        if j == nodes.count || i < leaves.count && leaves[i].0 < nodes[j].0 {
            e1 = leaves[i]
            i += 1
        } else {
            e1 = nodes[j]
            j += 1
        }
        
        // if there's no subtrees left, then that one was the answer
        if i == leaves.count && j == nodes.count {
            return e1.1
        }
        
        // get next subtree of least frequency
        var e2 : (Int, HuffmanTree<T>)
        if j == nodes.count || i < leaves.count && leaves[i].0 < nodes[j].0 {
            e2 = leaves[i]
            i += 1
        } else {
            e2 = nodes[j]
            j += 1
        }
        // create node from two subtrees
        nodes.append((e1.0 + e2.0, .Node(e1.1, e2.1)))
    }
}

func getFreqs<S : Sequence>(seq: S) -> [(S.Iterator.Element, Int)] where S.Iterator.Element : Hashable {
    var freqs : [S.Iterator.Element : Int] = [:]
    for c in seq {
        freqs[c] = (freqs[c] ?? 0) + 1
    }
    return Array(freqs)
}

let str = "this is an example for huffman encoding"
let charFreqs = getFreqs(seq: str.characters)
let tree = buildTree(freqs: charFreqs)
print("Symbol\tHuffman code")
tree.printCodes(prefix: "this")
