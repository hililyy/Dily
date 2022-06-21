//
//  DiaryFunction.swift
//  Dily
//
//  Created by 강조은 on 2022/06/21.
//

import Foundation

protocol DiaryFunction {
    func createDiaryData(enteredTitle: String, enteredContents: String, selectedEmotion: String)
    
    func readDiaryData()
    
    func updateDiaryData(diaryIndex: Int, editTitle: String, editContents: String)
    
    func deleteDiaryData(diaryIndex: Int)
}

protocol ReloadDataDelegate: AnyObject {
    func reloadMainTable()
}
