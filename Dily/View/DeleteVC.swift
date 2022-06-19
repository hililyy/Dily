//
//  DeleteVC.swift
//  Dily
//
//  Created by 강조은 on 2022/06/17.
//

import UIKit

class DeleteVC: UIViewController {
    var diaryIndex: Int?
    let model: DiaryModel = DiaryModel()
    let viewModel: DiaryViewModel = DiaryViewModel()
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)

           if let mainVC = presentingViewController as? MainVC {
               model.readDiaryData()
                   mainVC.diaryTableView.reloadData()
               
           }
       }
    @IBAction func deleteDiary(_ sender: Any) {
        guard let diaryIndex = diaryIndex else { return }
        model.deleteDiaryData(diaryIndex: diaryIndex)
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
