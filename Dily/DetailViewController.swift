//
//  DetailViewController.swift
//  Dily
//
//  Created by 강조은 on 2022/06/15.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var todayEmotion: UIImageView!
    @IBOutlet weak var todayTitle: UILabel!
    @IBOutlet weak var todayContents: UILabel!
    
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todayDate.text = Date()
    }
    
}
