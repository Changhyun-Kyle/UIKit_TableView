//
//  CityViewController.swift
//  boostcourse_WeatherToday
//
//  Created by 강창현 on 1/3/24.
//

import UIKit

class CityViewController: UIViewController {
    
    private var country: Country
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init?(country: Country, coder: NSCoder) {
        self.country = country
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
