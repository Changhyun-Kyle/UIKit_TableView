//
//  CountryTableViewCell.swift
//  boostcourse_WeatherToday
//
//  Created by 강창현 on 1/3/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var flageImageView: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
