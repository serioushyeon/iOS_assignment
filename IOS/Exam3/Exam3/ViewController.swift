//
//  ViewController.swift
//  Exam3
//
//  Created by jin on 4/24/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchBtn: UISwitch!
    @IBOutlet weak var closeUpBtn: UIButton!
    @IBOutlet weak var lampImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func closeUpBtnTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == "확대"{
            sender.setTitle("축소", for: .normal)
            lampImage.frame.size = CGSize(width: lampImage.frame.width*2, height: lampImage.frame.height*2)
        }
        else {
            sender.setTitle("확대", for: .normal)
            lampImage.frame.size = CGSize(width: lampImage.frame.width/2, height: lampImage.frame.height/2)
        }
    
    }
    
    @IBAction func switchBtnTapped(_ sender: UISwitch) {
        if sender.isOn{
            //스위치가 켜졌을때
            lampImage.image = UIImage(named: "LampOn")
            
            
        }else{
            //스위치가 꺼졌을때
            lampImage.image = UIImage(named: "LampOff")
        }
    }
}

