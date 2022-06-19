//
//  ViewController.swift
//  Dily
//
//  Created by 강조은 on 2022/06/13.
//

import UIKit

class MainVC: UIViewController {
    var emotionData: UIImage?
    @IBOutlet weak var diaryTableView: UITableView!
    
    let viewModel: DiaryViewModel = DiaryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryTableView.delegate = self
        diaryTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        diaryTableView.reloadData()
    }
    @IBAction func writeDiary(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "WriteVC") as? WriteVC {
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .popover
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return LocalDataStore.localDataStore.getTitle().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = diaryTableView.dequeueReusableCell(withIdentifier: "diarycell", for: indexPath) as! DiaryTableViewCell
        cell.title.text = LocalDataStore.localDataStore.getTitle()[indexPath.row]
        cell.contents.text = LocalDataStore.localDataStore.getContents()[indexPath.row]
        cell.emotionImage.image = UIImage(named: LocalDataStore.localDataStore.getEmotion()[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.todayEmotionData = UIImage(named: LocalDataStore.localDataStore.getEmotion()[indexPath.row])
            vc.todayTitleData = LocalDataStore.localDataStore.getTitle()[indexPath.row]
            vc.todayContentsData = LocalDataStore.localDataStore.getContents()[indexPath.row]
            vc.todayDateData = LocalDataStore.localDataStore.getDate()[indexPath.row]
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
