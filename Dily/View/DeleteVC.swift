//
//  DeleteVC.swift
//  Dily
//
//  Created by 강조은 on 2022/06/17.
//

import UIKit

class DeleteVC: UIViewController {
    var diaryIndex: Int?
    let model = DiaryModel.shareModel
    
    @IBAction func deleteDiary(_ sender: Any) {
        guard let diaryIndex = diaryIndex else { return }
        model.deleteDiaryData(diaryIndex: diaryIndex)
        
        NotificationCenter.default.post(name: NSNotification.Name("DismissView"), object: nil, userInfo: nil)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
