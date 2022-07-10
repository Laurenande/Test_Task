//
//  AddTableViewCell.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit

class AddTableViewCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
