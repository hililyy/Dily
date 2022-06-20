//
//  EditVC.swift
//  Dily
//
//  Created by 강조은 on 2022/06/21.
//

import UIKit

class EditVC: UIViewController {
    var diaryIndex: Int?
    var editTitle: String?
    var editContents: String?
    var beforeTitle: String?
    var beforeContents: String?
    let model = DiaryModel.shareModel
    
    @IBOutlet weak var diaryTitle: UITextField!
    @IBOutlet weak var diaryContents: UITextView!
    @IBOutlet weak var editBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryTitle.delegate = self
        diaryContents.delegate = self
        diaryTitle.text = beforeTitle
        diaryContents.text = beforeContents
        setBorder()
    }
    
    func setBorder() {
        diaryTitle.layer.borderWidth = 2
        diaryTitle.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        diaryTitle.layer.cornerRadius = 10
        diaryContents.layer.borderWidth = 2
        diaryContents.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        diaryContents.layer.cornerRadius = 10
        editBtn.layer.cornerRadius = 20
    }
    
    @IBAction func edit(_ sender: Any) {
        editTitle = diaryTitle.text
        editContents = diaryContents.text
        
        guard let diaryIndex = self.diaryIndex,
              let editTitle = self.editTitle,
              let editContents = self.editContents
        else { return }
        
        model.updateDiaryData(diaryIndex: diaryIndex, editTitle: editTitle, editContents: editContents)
        
        NotificationCenter.default.post(name: NSNotification.Name("DismissView"), object: nil, userInfo: nil)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

extension EditVC: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        diaryTitle.resignFirstResponder()
        diaryContents.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
