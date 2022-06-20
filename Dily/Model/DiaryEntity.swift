//
//  DiaryEntity.swift
//  Dily
//
//  Created by 강조은 on 2022/06/16.
//

import Foundation
import UIKit

struct DiaryEntity: Codable {
    var title: String?
    var contents: String?
    let emotion: String?
    let date: String?
}
