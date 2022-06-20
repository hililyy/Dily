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
    
    private init() { }
    
    func readDiaryData() {
        for count in 0...LocalDataStore.localDataStore.getTitle().count-1 {
            let entity = DiaryEntity(
                title: LocalDataStore.localDataStore.getTitle()[count],
                contents: LocalDataStore.localDataStore.getContents()[count],
                emotion: UIImage(named: LocalDataStore.localDataStore.getEmotion()[count]),
                date: LocalDataStore.localDataStore.getDate()[count])
            diaryList.append(entity)
        }
    }
    
    func createDiaryData(enteredTitle: String, enteredContents: String, selectedEmotion: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        let todayDate = dateFormatter.string(from: Date())
        LocalDataStore.localDataStore.setTitle(title: enteredTitle)
        LocalDataStore.localDataStore.setContents(contents: enteredContents)
        LocalDataStore.localDataStore.setDate(date: todayDate)
        LocalDataStore.localDataStore.setEmotion(emotion: selectedEmotion)
        
        let newEntity = DiaryEntity(
            title: enteredTitle,
            contents: enteredContents,
            emotion: UIImage(named: selectedEmotion),
            date: todayDate)

        diaryList.append(newEntity)
    }
    
    func deleteDiaryData(diaryIndex: Int) {
        diaryList.remove(at: diaryIndex)
        LocalDataStore.localDataStore.delTitle(index: diaryIndex)
        LocalDataStore.localDataStore.delContents(index: diaryIndex)
        LocalDataStore.localDataStore.delEmotion(index: diaryIndex)
        LocalDataStore.localDataStore.delDate(index: diaryIndex)
    }
}
