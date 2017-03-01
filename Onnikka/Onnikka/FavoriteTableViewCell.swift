//
//  FavoriteTableViewCell.swift
//  Onnikka
//
//  Created by Ville Marttila on 12.5.2016.
//
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet var bussIdImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
