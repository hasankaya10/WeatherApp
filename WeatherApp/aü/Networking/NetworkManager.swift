//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Hasan Kaya on 25.07.2022.
//

import Foundation
class NetworkManager {
    static var shared = NetworkManager()
    
    func fetchWeatherInfo(city : String, completion : @escaping (Data) -> Void){
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?appid=31fd6519f9f331f762109059a5e7e4bc&lang=tr&units=metric&q=\(city)") else {
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data {
                completion(data)
                    
            }

        }.resume()
    }
    
    
}
