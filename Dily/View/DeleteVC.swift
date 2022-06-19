//
//  DeleteVC.swift
//  Dily
//
//  Created by 강조은 on 2022/06/17.
//

import UIKit

class DeleteVC: UIViewController {
    var diaryIndex: Int?
    let viewModel: DiaryViewModel = DiaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func deleteDiary(_ sender: Any) {
        guard let diaryIndex = diaryIndex else { return }
        LocalDataStore.localDataStore.delTitle(index: diaryIndex)
        LocalDataStore.localDataStore.delContents(index: diaryIndex)
        LocalDataStore.localDataStore.delEmotion(index: diaryIndex)
        LocalDataStore.localDataStore.delDate(index: diaryIndex)
        
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
