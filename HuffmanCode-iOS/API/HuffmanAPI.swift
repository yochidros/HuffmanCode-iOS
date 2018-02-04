//
//  HuffmanAPI.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/09.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import APIKit

class HuffmanAPI {
    private init() {}
    
    struct PostHuffmanData: HuffmanRequest {
        typealias Response = HuffmanResponse
        let method: HTTPMethod = .post
        let path: String = "/huffman"
        var parameters: Any? {
            return ["data": HuffmanModel.share.frequency]
        }
    }
}
