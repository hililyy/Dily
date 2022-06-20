//
//  DiaryModel.swift
//  Dily
//
//  Created by 강조은 on 2022/06/16.
//

import Foundation
import UIKit

class DiaryModel {
    static let shareModel = DiaryModel()
    var diaryList: [DiaryEntity] = []
    
    private init() {}
    
    func createDiaryData(enteredTitle: String, enteredContents: String, selectedEmotion: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let todayDate = dateFormatter.string(from: Date())

        let newEntity = DiaryEntity(
            title: enteredTitle,
            contents: enteredContents,
            emotion: selectedEmotion,
            date: todayDate
        )

        diaryList.append(newEntity)
        LocalDataStore.localDataStore.setData(newData: diaryList)
    }
    
    func readDiaryData() {
        if LocalDataStore.localDataStore.getData().count != 0 {
            for count in 0...LocalDataStore.localDataStore.getData().count-1 {
                let entity = LocalDataStore.localDataStore.getData()[count]
                diaryList.append(entity)
            }
        }
    }
    
    func updateDiaryData(diaryIndex: Int, editTitle: String, editContents: String) {
        diaryList[diaryIndex].title = editTitle
        diaryList[diaryIndex].contents = editContents
        LocalDataStore.localDataStore.setData(newData: diaryList)
    }
    
    func deleteDiaryData(diaryIndex: Int) {
        diaryList.remove(at: diaryIndex)
        LocalDataStore.localDataStore.setData(newData: diaryList)
    }
}
