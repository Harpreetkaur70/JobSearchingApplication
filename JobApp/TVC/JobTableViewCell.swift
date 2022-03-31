//
//  JobTableViewCell.swift
//  JobApp
//

import UIKit

class JobTableViewCell: UITableViewCell {

    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var slugLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        rootView.layer.cornerRadius = 15;
        rootView.layer.borderWidth = 2;
        rootView.layer.borderColor = UIColor(hue: 0.1556, saturation: 0, brightness: 0.9, alpha: 1.0).cgColor;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
