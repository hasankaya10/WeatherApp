//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by Hasan Kaya on 23.07.2022.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var havaDurumuLabel: UILabel!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var dereceLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        

        
    }
    
}
