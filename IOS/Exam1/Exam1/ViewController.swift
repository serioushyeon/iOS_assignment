//
//  ViewController.swift
//  Exam1
//
//  Created by jin on 4/24/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func sendBtnTapped(_ sender: UIButton) {
        if let text = textField.text{
            titleLabel.text = "Hello, \(text)"
        }
        else {
            titleLabel.text = "Hello"
        }
    }
    
}

