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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        todayTitle.layer.borderWidth = 2
        todayTitle.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        todayTitle.layer.cornerRadius = 10
        
        todayContents.layer.borderWidth = 2
        todayContents.layer.borderColor = UIColor(named: "mainColor")?.cgColor
        todayContents.layer.cornerRadius = 10
    }
    
    func setData() {
        todayDate.text = todayDateData
        todayEmotion.image = todayEmotionData
        todayTitle.text = todayTitleData
        todayContents.text = todayContentsData
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
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
