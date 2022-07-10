//
//  CreatePasswordViewController.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit

class CreatePasswordViewController: UIViewController {

    public var password = ""
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        firstTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        secondTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        thirdTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        fourthTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField){

        let text = textField.text
        password += textField.text!
        if text?.utf16.count == 1{
            switch textField{
            case firstTextField:
                secondTextField.becomeFirstResponder()
            case secondTextField:
                thirdTextField.becomeFirstResponder()
            case thirdTextField:
                fourthTextField.becomeFirstResponder()
            case fourthTextField:
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let settingsVC = storyboard.instantiateViewController(withIdentifier: "RepeatPassword") as! RepeatPasswordViewController
                //settingsVC.passwordRepeat = password
                let defaults = UserDefaults.standard
                defaults.set(password, forKey: "myKey")
                self.show(settingsVC, sender: nil)
                password = ""
            default:
                break
            }
        }else{

        }
        
        print(password)
    }
    
    
    
}
extension CreatePasswordViewController : UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
            if range.length + range.location > currentCharacterCount {
                return false
            }
            let newLength = currentCharacterCount + string.count - range.length
            return newLength <= 1
    }
}
