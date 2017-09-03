//
//  UITextFieldExtension.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

extension UITextField{
    func identifyforOnlyNumber(string: String?) -> Bool{
        guard let text = string else { return false }
        let characterSet = CharacterSet.decimalDigits.inverted
        let compByCharInSet = text.components(separatedBy: characterSet)
        let numberFiltered = compByCharInSet.joined(separator: "")
        return text == numberFiltered
    }
}
