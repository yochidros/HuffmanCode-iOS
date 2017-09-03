//
//  FirstViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var assertLabel: UILabel!
    @IBOutlet weak var nextButton: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "first step"
        textField.delegate = self
        nextButton.isEnabled = false
        self.nextButton.alpha = 0.2
        nextButton.tintColor = UIColor.white
    }
    
    @IBAction func textFieldEditing(_ sender: Any) {
        if let count = textField.text?.characters.count, count != 0{
            if textField.identifyforOnlyNumber(string: textField.text){
                animate{
                    self.nextButton.isEnabled = true
                    self.nextButton.tintColor = UIColor.blue
                    self.nextButton.alpha = 1.0
                    self.assertLabel.alpha = 0.0
                }
                
            }else {
                animate {
                    self.nextButton.isEnabled = false
                    self.nextButton.tintColor = UIColor.white
                    self.nextButton.alpha = 0.2
                    self.assertLabel.text = "It's contain character or others\n It should contain only number"
                    self.assertLabel.alpha = 1.0
                }
                
                
            }
        }else {
            animate {
                self.nextButton.isEnabled = false
                self.nextButton.tintColor = UIColor.white
                self.nextButton.alpha = 0.2
                self.assertLabel.text = "please input number"
                self.assertLabel.alpha = 1.0
            }
            
        }
    }
    
    @IBAction func didSelectNext(){
        if let text = textField.text,let num = Int(text){
            if num <= 0{
                assertLabel.text = "please input number \n without 0 or minus number"
                assertLabel.alpha = 1.0
            }else {
                self.transition(to: DestinationInputDatasView(count: num))
            }
        }
    }
    
    private func animate(_ handler: @escaping (() -> Void)) {
        UIView.animate(withDuration: 0.4) {
            handler()
        }
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
}

