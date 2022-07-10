//
//  RepeatPasswordViewController.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit

class RepeatPasswordViewController: UIViewController {

    @IBOutlet weak var repeat1: UITextField!
    @IBOutlet weak var repeat2: UITextField!
    @IBOutlet weak var repeat3: UITextField!
    @IBOutlet weak var repeat4: UITextField!
    var passwordRepeat : String!
    var a = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        repeat1.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        repeat2.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        repeat3.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        repeat4.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
    }

    @objc func textFieldDidChange(textField: UITextField){

        let text = textField.text
        a += text!
        if text?.utf16.count == 1{
            switch textField{
            case repeat1:
                repeat2.becomeFirstResponder()
            case repeat2:
                repeat3.becomeFirstResponder()
            case repeat3:
                
                repeat4.becomeFirstResponder()
            case repeat4:
                let defaults = UserDefaults.standard
                let token = defaults.string(forKey: "myKey")
                if token == a {
                    let controller = storyboard?.instantiateViewController(withIdentifier: "HomeNC") as! UINavigationController
                    controller.modalPresentationStyle = .fullScreen
                    controller.modalTransitionStyle = .coverVertical
                    present(controller, animated: true, completion: nil)
                }
                
            default:
                break
            }
        }else{

        }
    }
}
extension RepeatPasswordViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
            if range.length + range.location > currentCharacterCount {
                return false
            }
            let newLength = currentCharacterCount + string.count - range.length
            return newLength <= 1
    }
}
