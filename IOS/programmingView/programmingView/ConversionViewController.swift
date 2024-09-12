//
//  ViewController.swift
//  programmingView
//
//  Created by jin on 4/19/24.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet weak var birdImageView: UIImageView!
    @IBOutlet weak var birdTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var birdLeadingConstraint: NSLayoutConstraint!
    var timer: Timer!
    var direction = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        // 뷰(outer) 객체를 생성하여 view에 부착한다
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .green
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
        
    }
    @objc func buttonPressed(_ sender: UIButton){
        if let text = sender.titleLabel?.text{
            if text == "Start"{
                // 타이머 생성, 새가 날기 시작
                timer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
                                             selector: #selector(timerAction),
                                             userInfo: nil, repeats: true)
            }else{
                // 타이머 중지
                timer.invalidate()
            }
            sender.setTitle((text == "Start") ? "Stop" : "Start", for: .normal)
        }
    }
    // Action함수처럼 @objc가 필요함
    @objc func timerAction(){
        // 왼쪽 여백의 값을 변경하여 새를 이동시킨다.
        birdLeadingConstraint.constant += CGFloat(direction*10)
        if birdLeadingConstraint.constant + birdImageView.frame.size.width >= view.frame.size.width{
            // 오른쪽 끝에 도달하면
            direction = -1
            // 새의 방향을 반전함
            birdImageView.transform = .init(scaleX: -1, y: 1)
        }else if birdLeadingConstraint.constant < 0{
            direction = 1
            birdImageView.transform = .init(scaleX: 1, y: 1)
        }
    }
}
