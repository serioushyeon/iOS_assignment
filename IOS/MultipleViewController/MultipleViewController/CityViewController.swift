//
//  CityViewController.swift
//  MultipleViewController
//
//  Created by jin on 5/5/24.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var landmarks: [City] = MultipleViewController.load("cityData.json")
    override func viewDidLoad() {
        super.viewDidLoad()
        cityPickerView.dataSource = self // 데이터 공급자로 등록
        cityPickerView.delegate = self // 대리자로 등록
        // 처음으로 선택하고자 하는 row 선택
        cityPickerView.selectRow(5, inComponent: 0, animated: true)
        descriptionLabel.text = landmarks[5].description
    }
}

extension CityViewController: UIPickerViewDataSource{
    // 이 함수는 Option이 아니다. 반드시 구현하여야 한다
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // 하나의 PickerView 즉, 이 피커뷰에 몇개의 컴포넌트를 둘것이냐?
        return 1
    }
    // 이 함수도 Option이 아니다. 반드시 구현하여야 한다
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // 각 컴포턴트에 몇개의 데이터가 있느냐?
        return landmarks.count
    }
}
extension CityViewController: UIPickerViewDelegate{
    // PickerView의 중앙에 오는 데이터에 대하여 호출한다(변경될때 한번)
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // PickerView 중앙에 오는 데이터가 선택된 row이다.
        // 여기서 landmarks[row].description을 descriptionLabel에 보이도록 한다
        descriptionLabel.text = landmarks[row].description
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let nameLabel = UILabel() // 리턴할 UILabel을 생성한다.
        nameLabel.text = landmarks[row].name // UILabel을 꾸민다
        let imageView = UIImageView(image: landmarks[row].uiImage()) // UIImageView객체를 만든다
        // 스택뷰를 생성한다.
        var outer = UIStackView(arrangedSubviews: [imageView, nameLabel])
        outer.axis = .vertical // 수직으로 배열한다.
        return outer
    }
    // PickerView의 높이를 설정할 수 있도록 호출해 준다
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        // 모든 UIView는 frame속성을 가지고 있고 frame.size에 너비와 높이를 가지고 있다.
        return pickerView.frame.size.height / 2
    }
}
