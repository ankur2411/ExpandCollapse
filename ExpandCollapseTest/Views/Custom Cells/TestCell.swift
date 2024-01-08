//
//  TestCell.swift
//  ExpandCollapseTest
//
//  Created on 08/01/24.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var btn_expandCollapse: UIButton!
    @IBOutlet weak var lbl_mainData: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(data:DataModel){
        self.lbl_mainData.text = data.mainTitle
        if data.isExpand{
            self.btn_expandCollapse.setImage(UIImage(systemName: "chevron.up.circle.fill"), for: .normal)
        }
        else{
            self.btn_expandCollapse.setImage(UIImage(systemName: "chevron.down.circle.fill"), for: .normal)
        }
    }
}
