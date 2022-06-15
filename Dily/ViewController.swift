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
    var dateData: [String] = ["1999년 4월 6일"]
    
    @IBOutlet weak var diaryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        diaryTableView.delegate = self
        diaryTableView.dataSource = self
    }
    @IBAction func writeDiary(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "modalViewController") as? modalViewController {
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .popover
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = diaryTableView.dequeueReusableCell(withIdentifier: "diarycell", for: indexPath) as! DiaryTableViewCell
        cell.title.text = titleData[indexPath.row]
        cell.contents.text = contentsData[indexPath.row]
        cell.emotionImage.image = emotionData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ViewController: SendDataDelegate {
    func sendData(emotion: String, title: String, contents: String) {
        titleData.append(title)
        contentsData.append(contents)
        
        switch emotion {
            case "love":
            guard let emotionImage = UIImage(named: "love") else { return }
            emotionData.append(emotionImage)
            case "happy":
            guard let emotionImage = UIImage(named: "happy") else { return }
            emotionData.append(emotionImage)
            case "sick":
            guard let emotionImage = UIImage(named: "sick") else { return }
            emotionData.append(emotionImage)
            case "sad":
            guard let emotionImage = UIImage(named: "sad") else { return }
            emotionData.append(emotionImage)
            case "angry":
            guard let emotionImage = UIImage(named: "angry") else { return }
            emotionData.append(emotionImage)
        default:
            return
        }
        
        diaryTableView.reloadData()
    }
}

protocol SendDetailDataDeligate: AnyObject {
    func sendDetailData(emotion: String, title: String, contents: String)
}
