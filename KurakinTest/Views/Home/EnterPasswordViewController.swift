//
//  EnterPasswordViewController.swift
//  KurakinTest
//
//  Created by Егор Куракин on 10.07.2022.
//

import UIKit

class EnterPasswordViewController: UIViewController{
    @IBOutlet weak var enter1: UITextField!
    
    @IBOutlet weak var enter2: UITextField!
    @IBOutlet weak var enter3: UITextField!
    @IBOutlet weak var enter4: UITextField!
    var passwordRepeat : String!
    var a = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
       enter1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        enter2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        enter3.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        enter4.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
         
         
    }

    @objc func textFieldDidChange(textField: UITextField){

        let text = textField.text
        a += text!
        if text?.utf16.count == 1{
            switch textField{
            case enter1:
                enter2.becomeFirstResponder()
            case enter2:
                enter3.becomeFirstResponder()
            case enter3:
                enter4.becomeFirstResponder()
            case enter4:
                let defaults = UserDefaults.standard
                let token = defaults.string(forKey: "myKey")
                if token == a {
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let homeVC = storyboard.instantiateViewController(withIdentifier: "homeView") as! HomeViewController

                    self.show(homeVC, sender: nil)
                }
                
            default:
                break
            }
        }else{

        }
    }
}
extension EnterPasswordViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
            if range.length + range.location > currentCharacterCount {
                return false
            }
            let newLength = currentCharacterCount + string.count - range.length
            return newLength <= 1
    }
}

