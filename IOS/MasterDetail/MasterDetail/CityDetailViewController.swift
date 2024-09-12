//
//  ViewController.swift
//  MasterDetail
//
//  Created by jin on 5/29/24.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var countryPickerView: UIPickerView!
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var cityImageView: UIImageView!
    
    @IBOutlet weak var stackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewBottomConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Gesture Recognizers
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(capturePicture))
        cityImageView.addGestureRecognizer(imageTapGesture)
        cityImageView.isUserInteractionEnabled = true
        
        let viewTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(viewTapGesture)
        
        // Keyboard Notification
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func savingCity(_ sender: UIButton) {
        // Save city action
    }
    
    @objc func capturePicture(sender: UITapGestureRecognizer){
        // 사진찍는 별도의 UIViewController가 UIImagePickerController이다.
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self // 이를 설정하면 사진을 찍은후 호출된다
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // 카메라가 있다면 카메라로부터
            imagePickerController.sourceType = .camera
        }else{
            // 카메라가 없으면 앨범으로부터
            imagePickerController.sourceType = .savedPhotosAlbum
        }
        // 시뮬레이터는 카메라가 없으므로, 실 아이폰의 경우 이라인 삭제
        imagePickerController.sourceType = .savedPhotosAlbum
        // UIImagePickerController이 전이 된다
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard(sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        adjustKeyboard(isShowing: true, notification: notification)
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        adjustKeyboard(isShowing: false, notification: notification)
    }
    
    func adjustKeyboard(isShowing: Bool, notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        let adjustmentHeight = keyboardFrame.height * (isShowing ? 1 : -1)
        stackViewTopConstraint.constant -= adjustmentHeight
        stackViewBottomConstraint.constant += adjustmentHeight
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension CityDetailViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            cityImageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
