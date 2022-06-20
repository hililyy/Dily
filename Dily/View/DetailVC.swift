//
//  DetailViewController.swift
//  Dily
//
//  Created by 강조은 on 2022/06/15.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var todayEmotion: UIImageView!
    @IBOutlet weak var todayTitle: PaddingLabel!
    @IBOutlet weak var todayContents: PaddingLabel!
    
    var todayDateData: String?
    var todayEmotionData: UIImage?
    var todayTitleData: String?
    var todayContentsData: String?
    var diaryIndex: Int?
    
    let model = DiaryModel.shareModel
    let viewModel: DiaryViewModel = DiaryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setBorder()
    }
    
    func setData() {
        todayDate.text = todayDateData
        todayEmotion.image = todayEmotionData
        todayTitle.text = todayTitleData
        todayContents.text = todayContentsData
    }
    
    func setBorder() {
        todayTitle.layer.borderWidth = 2
        todayTitle.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        todayTitle.layer.cornerRadius = 10
        
        todayContents.layer.borderWidth = 2
        todayContents.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        todayContents.layer.cornerRadius = 10
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
    

    @IBAction func goDelete(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DeleteVC") as? DeleteVC {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.diaryIndex = self.diaryIndex
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func goEdit(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditVC") as? EditVC {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.diaryIndex = self.diaryIndex
            vc.beforeTitle = todayTitleData
            vc.beforeContents = todayContentsData
            self.present(vc, animated: true, completion: nil)
        }
    }
}

@IBDesignable class PaddingLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 8.0
    @IBInspectable var rightInset: CGFloat = 8.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + leftInset + rightInset, height: size.height + topInset + bottomInset)
    }
}
