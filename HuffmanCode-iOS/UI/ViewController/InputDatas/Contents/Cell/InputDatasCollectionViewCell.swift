//
//  InputDatasCollectionViewCell.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit

class InputDatasCollectionViewCell: UICollectionViewCell {
    // textfield height 20 margin 18 width 180
    
    var charactersTextFields: [UITextField] = []
    var frequencyTextFields: [UITextField] = []
    var characterCount: Int = 0
    weak var delegate: InputDatasCellDelegate?
    
    @IBOutlet weak var charactersLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var assertLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        assertLabel.alpha = 0.0
    }
    
    func generateTextField(){
        for _ in 0..<characterCount {
            let tc = UITextField(); let tf = UITextField()
            tc.borderStyle = UITextBorderStyle.bezel
            tf.borderStyle = UITextBorderStyle.bezel
            tc.autocapitalizationType = .none
            tf.autocapitalizationType = .none
            charactersTextFields.append(tc)
            frequencyTextFields.append(tf)
            self.addSubview(tc)
            self.addSubview(tf)
        }
        layoutIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTextFields()
    }
    
    @IBAction func didSelectCalcuration(){
        var temp: [ String : Int ] = [ : ]
        for i in 0..<characterCount {
            let isFreq = frequencyTextFields[i].identifyforOnlyNumber(string: frequencyTextFields[i].text)
            if isFreq  {
                temp[charactersTextFields[i].text ?? "-"] = Int(frequencyTextFields[i].text ?? "0")
            }
        }
        if checkFrequrecy(){
            assertLabel.alpha = 0.0
            delegate?.cellDidSelectCalcurate(self, datas: temp)
        }else {
            assertLabel.text = """
            ERROR:
            Frequrency must be satisfied to 100 %
            """
            assertLabel.alpha = 1.0
        }
    }
    
    private func checkFrequrecy() -> Bool{
        var total = 0
        frequencyTextFields.forEach { (t) in
            if t.identifyforOnlyNumber(string: t.text) {
                guard let text = t.text , let f = Int(text) else { return }
                total = total + f
            }
        }
        return total == 100
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        charactersTextFields.forEach { (textField) in
            if textField.isFirstResponder {
                textField.resignFirstResponder()
            }
        }
        
        frequencyTextFields.forEach { (textField) in
            if textField.isFirstResponder {
                textField.resignFirstResponder()
            }
        }
    }
    
}

extension InputDatasCollectionViewCell{
    
    func layoutTextFields(){
        let charLabelFrame = charactersLabel.frame
        let freqLabelFrame = frequencyLabel.frame
        var y:CGFloat = 18.0
        charactersTextFields.forEach { (t) in
            t.frame = CGRect(x: charLabelFrame.minX, y: charLabelFrame.maxY + y, width: 100, height: 20)
            y = y + 18.0 + 20.0
        }
        y = 18.0
        frequencyTextFields.forEach { (t) in
            t.frame = CGRect(x: freqLabelFrame.minX, y: freqLabelFrame.maxY + y, width: 100, height: 20)
            y = y + 18.0 + 20.0
        }
    }
}
