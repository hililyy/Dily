//
//  LocalDataStore.swift
//  Dily
//
//  Created by 강조은 on 2022/06/16.
//

import Foundation
import UIKit

class LocalDataStore {
    static let localDataStore = LocalDataStore()
    
    func getData() -> [DiaryEntity] {
        guard let getData = UserDefaults.standard.value(forKey: LocalDataKeySet.DIARY_DATA.rawValue) as? Data else { return [] }
        let diaryData = try? PropertyListDecoder().decode (
                Array<DiaryEntity>.self, from: getData
            )
        return diaryData ?? []
    }
    
    func setData(newData: [DiaryEntity]) {
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(newData), forKey: LocalDataKeySet.DIARY_DATA.rawValue)
    }
}
