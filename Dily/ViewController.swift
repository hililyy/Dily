//
//  ViewController.swift
//  Dily
//
//  Created by 강조은 on 2022/06/13.
//

import UIKit

class ViewController: UIViewController {
    var titleData: [String] = ["어쩔티비"]
    var contentsData: [String] = ["저쩔티비"]
    var emotionData: [UIImage] = [UIImage(named: "happy@1x.png")!]
    
    @IBOutlet weak var diaryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryTableView.delegate = self
        diaryTableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = diaryTableView.dequeueReusableCell(withIdentifier: "diarycell", for: indexPath) as! DiaryTableViewCell
        cell.title.text = titleData[indexPath.row]
        cell.contents.text = contentsData[indexPath.row]
        cell.emotionImage.image = emotionData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
}
