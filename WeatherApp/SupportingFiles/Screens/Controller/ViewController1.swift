//
//  ViewController.swift
//  WeatherApp
//
//  Created by Hasan Kaya on 23.07.2022.
//

import UIKit

class ViewController1: UIViewController,UITableViewDelegate, UITableViewDataSource{
    var weatherResponse : Weather? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var hissedilenLabel: UILabel!
    @IBOutlet weak var dereceLabel: UILabel!
    @IBOutlet weak var tarihLabel: UILabel!
    @IBOutlet weak var havaDurumuLabel: UILabel!
    @IBOutlet weak var sehirNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var iconImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        iconImageView.image = UIImage(named: "sun")
        iconImageView.layer.cornerRadius = 51
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let temp = ((self.weatherResponse?.list?.count ?? 0) / 8 - 1 )
        return temp ?? .zero
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        let index = ((indexPath.row + 1) * 8)
        cell.tarihLabel.text = weatherResponse?.list?[index].dtTxt
        cell.dereceLabel.text = "Derece : \(String((self.weatherResponse?.list?[index].main?.temp)!)) "
        cell.havaDurumuLabel.text = self.weatherResponse?.list?[index].weather?[0].weatherDescription
        cell.iconImageView.image = getIcon(havaDurumu: cell.havaDurumuLabel.text ?? " ")
        
        
        return cell
    }
    func setDatas(city : String){
        NetworkManager.shared.fetchWeatherInfo(city: city) { data in
            do {
                let response = try JSONDecoder().decode(Weather.self, from: data)
                self.weatherResponse = response
                DispatchQueue.main.async {
                    if let havaDurumu = self.weatherResponse?.list?[0].weather?[0].weatherDescription as? String {
                        self.havaDurumuLabel.text = "Bugün hava \(havaDurumu)"
                    }
                    if let derece =  self.weatherResponse?.list?[0].main?.temp as? Double {
                        let dereceString = String(derece)
                        self.dereceLabel.text = " \(dereceString)C°"
                    }
                    if let sehirIsim = self.weatherResponse?.city?.name as? String {
                        self.sehirNameLabel.text = sehirIsim
                    }
                    if let minLabel = self.weatherResponse?.list?[0].main?.tempMin as? Double {
                        let minString = String(minLabel)
                        self.minLabel.text = "Min: \(minLabel)"
                    }
                    if let maxLabel = self.weatherResponse?.list?[0].main?.tempMax as? Double {
                        let maxString = String(maxLabel)
                        self.maxLabel.text = "Max: \(maxString)"
                    }
                    if let tarih = self.weatherResponse?.list?[0].dtTxt as? String {
                        self.tarihLabel.text = tarih
                    }
                    if let hissedilen = self.weatherResponse?.list?[0].main?.feelsLike as? Double {
                        self.hissedilenLabel.text = "Hissedilen \(hissedilen)"
                    }
                    
                    
                }
            } catch {
                print("Hata")
            }
        }
    }
    
    func getIcon(havaDurumu : String) -> UIImage{
        if havaDurumu == "açık" {
            return UIImage(named: "sun")!
            
        }
        else if havaDurumu == "parçalı az bulutlu" {
            return UIImage(named: "cloudy")!
            
        }
        else if havaDurumu == "az bulutlu" {
            return UIImage(named: "cloudy")!
            
        }
        else if havaDurumu == "parçalı bulutlu" {
            return UIImage(named: "cloudy")!
        }
        else if havaDurumu == "yağmurlu" {
            return UIImage(named: "rain")!
        }
        else if havaDurumu == "karlı" {
            return UIImage(named: "snowy")!
        }
        else {
            return UIImage(named: "hot-weather")!
        }
    }

    
    
    
    
    


}

