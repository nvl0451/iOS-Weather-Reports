//
//  ListCell.swift
//  rtc_weather
//
//  Created by Андрей Королев on 02.05.2022.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var cityStatusLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!
    
    func configure (weather: Weather) {
        self.cityNameLabel.text = weather.name
        self.cityStatusLabel.text = weather.conditionString
        self.cityTempLabel.text = weather.tempString
    }
}
