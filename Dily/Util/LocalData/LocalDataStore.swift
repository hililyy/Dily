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
    
    func getTitle() -> [String] {
        UserDefaults.standard.array(forKey: LocalDataKeySet.DIARY_TITLE.rawValue) as? [String] ?? []
    }
    func setTitle(title: String) {
        var getTitle = getTitle()
        getTitle.append(title)
        UserDefaults.standard.set(getTitle, forKey: LocalDataKeySet.DIARY_TITLE.rawValue)
    }
    func delTitle(index: Int) {
        var getTitle = getTitle()
        getTitle.remove(at: index)
        UserDefaults.standard.set(getTitle, forKey: LocalDataKeySet.DIARY_TITLE.rawValue)
    }
    
    func editTitle(index: Int, editTitle: String) {
        var getTitle = getTitle()
        getTitle[index] = editTitle
        UserDefaults.standard.set(getTitle, forKey: LocalDataKeySet.DIARY_TITLE.rawValue)
    }
    
    
    func getContents() -> [String] {
        UserDefaults.standard.array(forKey: LocalDataKeySet.DIARY_CONTENTS.rawValue) as? [String] ?? []
    }
    func setContents(contents: String) {
        var getContents = getContents()
        getContents.append(contents)
        UserDefaults.standard.set(getContents, forKey: LocalDataKeySet.DIARY_CONTENTS.rawValue)
    }
    func delContents(index: Int) {
        var getContents = getContents()
        getContents.remove(at: index)
        UserDefaults.standard.set(getContents, forKey: LocalDataKeySet.DIARY_CONTENTS.rawValue)
    }
    func editContents(index: Int, editContents: String) {
        var getContents = getContents()
        getContents[index] = editContents
        UserDefaults.standard.set(getContents, forKey: LocalDataKeySet.DIARY_CONTENTS.rawValue)
    }
    
    func getEmotion() -> [String] {
        UserDefaults.standard.array(forKey: LocalDataKeySet.DIARY_EMOTION.rawValue) as? [String] ?? []
    }
    func setEmotion(emotion: String) {
        var getEmotion = getEmotion()
        getEmotion.append(emotion)
        UserDefaults.standard.set(getEmotion, forKey: LocalDataKeySet.DIARY_EMOTION.rawValue)
    }
    func delEmotion(index: Int) {
        var getEmotion = getEmotion()
        getEmotion.remove(at: index)
        UserDefaults.standard.set(getEmotion, forKey: LocalDataKeySet.DIARY_EMOTION.rawValue)
    }
    
    
    func getDate() -> [String] {
        UserDefaults.standard.array(forKey: LocalDataKeySet.DIARY_DATE.rawValue) as? [String] ?? []
    }
    func setDate(date: String) {
        var getDate = getDate()
        getDate.append(date)
        UserDefaults.standard.set(getDate, forKey: LocalDataKeySet.DIARY_DATE.rawValue)
    }
    func delDate(index: Int) {
        var getDate = getDate()
        getDate.remove(at: index)
        UserDefaults.standard.set(getDate, forKey: LocalDataKeySet.DIARY_DATE.rawValue)
    }
}
