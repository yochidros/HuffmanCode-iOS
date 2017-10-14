//
//  HuffmanRequest.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/10/14.
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


class DecodableDataParser: DataParser {
    var contentType: String? {
        return "application/json"
    }
    func parse(data: Data) throws -> Any {
        return data
    }
}
