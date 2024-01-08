//
//  SubHeaderCell.swift
//  ExpandCollapseTest
//
//  Created on 08/01/24.
//

import UIKit

class SubHeaderCell: UITableViewCell {
    @IBOutlet weak var lbl_subHeader: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data:DataModel, withRow:Int) {
        self.lbl_subHeader.text = data.subTitle[withRow - 1]
    }
}
