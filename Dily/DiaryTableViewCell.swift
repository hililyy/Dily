//
//  DiaryTableViewCell.swift
//  Dily
//
//  Created by 강조은 on 2022/06/13.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {

    @IBOutlet weak var emotionImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contents: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
