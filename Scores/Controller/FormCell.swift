//
//  FormCell.swift
//  Scores
//
//  Created by Zaid Alderi on 27/09/2022.
//

import UIKit

class FormCell: UITableViewCell {

    @IBOutlet weak var formView: UIView!
    @IBOutlet weak var game5Label: UILabel!
    @IBOutlet weak var game4Label: UILabel!
    @IBOutlet weak var game3Label: UILabel!
    @IBOutlet weak var game2Label: UILabel!
    @IBOutlet weak var game1Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        game1Label.layer.masksToBounds = true
        game1Label.layer.cornerRadius = game1Label.frame.width / 2
        game2Label.layer.masksToBounds = true
        game2Label.layer.cornerRadius = game2Label.frame.width / 2
        game3Label.layer.masksToBounds = true
        game3Label.layer.cornerRadius = game3Label.frame.width / 2
        game4Label.layer.masksToBounds = true
        game4Label.layer.cornerRadius = game4Label.frame.width / 2
        game5Label.layer.masksToBounds = true
        game5Label.layer.cornerRadius = game5Label.frame.width / 2



    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
