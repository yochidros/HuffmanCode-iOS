//
//  API.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/09.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import APIKit

protocol HuffmanRequest: Request {
}
extension HuffmanRequest {
    var baseURL: URL {
        return URL(string: "http://localhost:8000")!
    }
}

extension HuffmanRequest where Response: Decodable {
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        guard let data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

struct HuffmanResponse: Decodable {
    let message: String
    private enum CodingKeys: String, CodingKey {
        case message
    }
}
class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}

class HuffmanAPI {
    private init() {}
    
    struct PostHuffmanData: HuffmanRequest {
        typealias Response = HuffmanResponse
        let method: HTTPMethod = .post
        let path: String = "/huffman"
        var parameters: Any? {
            return ["data": Huffman3.share.freq]
        }
    }
}

class HuffmanSession<T: Request>{
    func session(request: T) {
        Session.send(request) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
    }
}

