//
//  LeagueCell.swift
//  Scores
//
//  Created by Zaid Alderi on 27/09/2022.
//

import UIKit

class LeagueCell: UITableViewCell {

    @IBOutlet weak var leagueLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var leagueView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
