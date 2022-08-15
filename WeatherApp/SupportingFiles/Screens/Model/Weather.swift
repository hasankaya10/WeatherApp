

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    
    let cod: String?
    let message, cnt: Int?
    let list: [List]?
    let city: City?
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let country: String?
    let population, timezone, sunrise, sunset: Int?
}



// MARK: - List
struct List: Codable {
    let dt: Int?
    let main: MainClass?
    let weather: [WeatherElement]?
    let clouds: Clouds?
    let wind: Wind?
    let visibility, pop: Int?
    let sys: Sys?
    let dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, seaLevel, grndLevel, humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: String?
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - WeatherElement
struct WeatherElement: Codable {
    let id: Int?
    let main: String?
    let weatherDescription: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Icon: String, Codable {
    case the01D = "01d"
    case the01N = "01n"
    case the02D = "02d"
    case the02N = "02n"
    case the03N = "03n"
    case the04N = "04n"
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}

enum Description: String, Codable {
    case azBulutlu = "az bulutlu"
    case açık = "açık"
    case parçalıAzBulutlu = "parçalı az bulutlu"
    case parçalıBulutlu = "parçalı bulutlu"
    case yağmurlu = "yağmurlu"
    case kapalı = "kapalı"
    case hafifYağmur = "hafif yağmur"
    case ortaŞiddetliYağmur = "Orta Şiddetli Yağmur"
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}
