//
//  ViewController.swift
//  Dily
//
//  Created by 강조은 on 2022/06/13.
//

import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var diaryTableView: UITableView!
    
    var emotionData: UIImage?
    let model = DiaryModel.shareModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.didDismissNotification(_:)),
            name: NSNotification.Name("DismissView"),
            object: nil
        )
        diaryTableView.delegate = self
        diaryTableView.dataSource = self
        model.readDiaryData()
    }

    @IBAction func writeDiary(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "WriteVC") as? WriteVC {
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .popover
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @objc func didDismissNotification(_ notification: Notification) {
        DispatchQueue.main.async {
            self.diaryTableView.reloadData()
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.diaryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = diaryTableView.dequeueReusableCell(withIdentifier: "diarycell", for: indexPath) as! DiaryTableViewCell
        cell.title.text = model.diaryList[indexPath.row].title
        cell.contents.text = model.diaryList[indexPath.row].contents
        cell.emotionImage.image = model.diaryList[indexPath.row].emotion
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.todayEmotionData = model.diaryList[indexPath.row].emotion
            vc.todayTitleData = model.diaryList[indexPath.row].title
            vc.todayContentsData = model.diaryList[indexPath.row].contents
            vc.todayDateData = model.diaryList[indexPath.row].date
            vc.diaryIndex = indexPath.row
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension MainVC: ReloadDataDelegate {
    func reloadMainTable() {
        diaryTableView.reloadData()
    }
}
