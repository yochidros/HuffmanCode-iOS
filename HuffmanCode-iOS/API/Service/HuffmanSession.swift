//
//  HuffmanSession.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/10/14.
//  Copyright © 2017年 yochio. All rights reserved.
//

import Foundation
import APIKit

final class HuffmanSession<T: Request>{
    static func session(request: T) {
        Session.send(request) { result in
            switch result {
            case .success(let response):
                guard let response = response as? HuffmanResponse else {
                    return
                }
                HuffmanModel.share.responseData = response
            case .failure(let error):
                HuffmanModel.share.responseData = nil
                print(error)
            }
        }
    }
}
