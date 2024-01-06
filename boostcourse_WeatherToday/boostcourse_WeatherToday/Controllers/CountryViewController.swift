//
//  ViewController.swift
//  boostcourse_WeatherToday
//
//  Created by 강창현 on 1/3/24.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var countryTableView: UITableView!
    private let countryCellIdentifier = "countryCell"
    private var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    private func loadData() {
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard
            let dataAsset: NSDataAsset = NSDataAsset(name: "countries")
        else {
            return
        }
        
        do {
            countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
        countryTableView.reloadData()
    }
    
    private func showCityViewController(country: Country) {
        guard let cityViewController = storyboard?.instantiateViewController(identifier: "CityViewController", creator: { coder in
            CityViewController(country: country, coder: coder)
        })
        else {
            return
        }
        navigationController?.pushViewController(cityViewController, animated: true)
    }
}

extension CountryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell: CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: countryCellIdentifier, for: indexPath) as? CountryTableViewCell
        else {
            return UITableViewCell()
        }
        let country = countries[indexPath.row]
        cell.countryName.text = country.name
        cell.flageImageView.image = UIImage(named: country.flagImage)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showCityViewController(country: countries[indexPath.row])
    }
    
}
