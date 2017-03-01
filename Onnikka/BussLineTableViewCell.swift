//
//  BussLineTableViewCell.swift
//  Onnikka
//
//  Created by Ville Marttila on 21/07/16.
//
//

import UIKit

class BussLineTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet var bussNumber: UIImageView!
    @IBOutlet var lineName: UILabel!
    @IBOutlet var driveTime: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
