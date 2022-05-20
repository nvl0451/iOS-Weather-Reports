//
//  DetailVC.swift
//  rtc_weather
//
//  Created by Андрей Королев on 02.05.2022.
//

import UIKit
import SwiftSVG

class DetailVC: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIView!
    @IBOutlet weak var cityStatusLabel: UILabel!
    @IBOutlet weak var cityTempLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    var weatherModel: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        refreshLabels()
    }
    
    func refreshLabels() {
        cityNameLabel.text = weatherModel?.name
        
        //image shit
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weatherModel!.conditionCode).svg")
        let weatherImage: UIView = UIView(SVGURL: URL(string: "https://raw.githubusercontent.com/efc/SwiftSVG/master/SwiftSVGExamples/hawaiiFlowers.svg")!) { (image) in
            image.resizeToFit(self.weatherImageView.bounds)
        }
        self.weatherImageView.addSubview(weatherImage)
        //print(url)
        /*print(weatherModel?.conditionCode)
        
        let betterImage: SVGKImage = SVGKImage(contentsOf: url)
        
        betterImage.size = self.weatherImageView.bounds.size
        let betterImageView:UIImageView = UIImageView()
        betterImageView.image = betterImage.uiImage
        
        
        let image = UIImageView()
        image.load(url: url!)
        self.weatherImageView.addSubview(image)*/
        
        /*let data = try? Data(contentsOf: url!)
        let document = FantasticSnowflake.Document(data: data!)
        print(document)
        let myView = document?.svg.view(size: CGSize(width: 100,height: 100))
        self.weatherImageView.addSubview(myView!)
        let svgString = String(decoding: data!, as: UTF8.self)
        let newImage = try? SVGParser.parse(text: svgString)
        let newView = SVGView(node: newImage!, coder: NSCoder())
        self.weatherImageView.addSubview(newView!)*/
        
        NSLayoutConstraint.activate([
            weatherImage.centerXAnchor.constraint(equalTo: weatherImageView.centerXAnchor),
            weatherImage.centerYAnchor.constraint(equalTo: weatherImageView.centerYAnchor)
        ])
        
        cityStatusLabel.text = weatherModel?.conditionString
        cityTempLabel.text = weatherModel?.tempString
        pressureLabel.text = "\((weatherModel?.pressureMm)!)"
        windSpeedLabel.text = "\((weatherModel?.windSpeed)!)"
        minTempLabel.text = "\((weatherModel?.tempMin)!)"
        maxTempLabel.text = "\((weatherModel?.tempMax)!)"
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                } else {
                    print("wtf is this?")
                }
            }
        }
    }
}
