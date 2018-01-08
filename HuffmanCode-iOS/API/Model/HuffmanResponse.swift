//
//  HuffmanResponse.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/10/14.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import APIKit

struct HuffmanResponse: Decodable {
    let imageName: String
    private enum CodingKeys: String, CodingKey {
        case imageName = "image_name"
    }
}
