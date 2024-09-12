//
//  ConversionViewController.swift
//  Conversion
//
//  Created by jin on 3/29/24.
//

import UIKit
class ConversionViewController: UIViewController {
    
    @IBOutlet weak var fahrenheitTextField: UITextField!
    @IBOutlet weak var celsiusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        fahrenheitTextField.delegate = self
        fahrenheitTextField = view.subviews[0] as! UITextField
        celsiusLabel = view.subviews[4] as? UILabel
        
        fahrenheitTextField.text = "123"
        let celsiusValue = 5.0 / 9.0 * (123.0 - 32)
        
        celsiusLabel?.text = String(celsiusValue)
    }
    @IBAction func fahrenheitEditingChanged(_ sender: UITextField) {
        // 여기서 sender이 fahrenheitTextField 객체이다.
        if let text = sender.text { // 그내용이 뭔가 있으면, 옵셔널 바인딩
            // 문자열 -> Double 형변환, Double(text)가 nil수도 있다
            if let fahrenheitValue = Double(text){
                let celsiusValue = 5.0/9.0*(fahrenheitValue - 32.0) // 변환
                celsiusLabel.text = String(format: "%.2f", celsiusValue)
            }else{
                celsiusLabel.text = "???"
            }
        }
    }
}
extension ConversionViewController{
    @objc func dismissKeyboard(sender: UITapGestureRecognizer){
        fahrenheitTextField.resignFirstResponder()
    }
}
extension ConversionViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existing = textField.text?.range(of: ".")
        let comming = string.range(of: ".")
        if existing != nil, comming != nil {
            return false
        }
        return true
    }
}
