//
//  WeatherModel.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import Foundation

struct CurrentWeatherModel : Decodable {
    let weather: [WeatherInfo]
    let cod: Int
    let name: String
    let main: TemperatureModel
    let wind: WindModel
    let visibility: Int
    let sys: SysModel
    let clouds: CloudsModel
}


struct CloudsModel : Decodable {
    let all: Double
}

struct WindModel : Decodable{
    let speed : Double
    var deg : Double
    
    var windDirection: String {
        switch deg {
        case 348.75...361:
            return "N"
        case 0...11.25:
            return "N"
        case 11.25...33.75:
            return "NNE"
        case 33.75...56.25:
            return "NE"
        case 56.25...78.75:
            return "ENE"
        case 78.75...101.25:
            return "E"
        case 101.25...123.75:
            return "ESE"
        case 123.75...146.25:
            return "SE"
        case 146.25...168.75:
            return "SSE"
        case 168.75...191.25:
            return "S"
        case 191.25...213.75:
            return "SSW"
        case 213.75...236.25:
            return "SW"
        case 236.25...258.75:
            return "WSW"
        case 258.75...281.25:
            return "W"
        case 281.25...303.75:
            return "WNW"
        case 303.75...326.25:
            return "NW"
        case 326.25...348.75:
            return "NNW"
        default:
            return String("\(deg)?")
        }
    }
}

struct TemperatureModel: Decodable {
    let temp : Double
    let feels_like : Double
    let temp_min : Double
    let temp_max : Double
    let pressure : Double
    let humidity : Double
}

struct SysModel: Decodable {
    let sunrise: Int
    let sunset: Int
    let country: String
}


struct WeatherInfo: Decodable {
    let id : Int
    
    var conditionIcon: String {
        switch id {
        case 200...232:
            return "11d"
        case 300...321:
            return "09d"
        case 500...531:
            return "09d"
        case 600...622:
            return "13d"
        case 701...781:
            return "50d"
        case 800:
            return "01d"
        case 801:
            return "02d"
        case 802:
            return "03d"
        case 803...804:
            return "04d"
        default:
            return "02d"
        }
    }
    
    var conditionName: String {
        switch id {
        case 200:
            return "thunderstorm with light rain"
        case 201:
            return "thunderstorm with rain"
        case 202:
            return "thunderstorm with heavy rain"
        case 210:
            return "light thunderstorm"
        case 211:
            return "thunderstorm"
        case 212:
            return "heavy thunderstorm"
        case 221:
            return "ragged thunderstorm"
        case 230:
            return "thunderstorm with light drizzle"
        case 231:
            return "thunderstorm with drizzle"
        case 232:
            return "thunderstorm with heavy drizzle"
            
            
            
        case 300:
            return "light intensity drizzle"
        case 301:
            return "drizzle"
        case 302:
            return "heavy intensity drizzle"
        case 310:
            return "light intensity drizzle"
        case 311:
            return "drizzle rain"
        case 312:
            return "heavy intensity drizzle rain"
        case 313:
            return "shower rain and drizzle"
        case 314:
            return "heavy shower rain and drizzle"
        case 321:
            return "shower drizzle"
            
            
            
        case 500:
            return "light rain"
        case 501:
            return "moderate rain"
        case 502:
            return "heavy intensity rain"
        case 503:
            return "very heavy rain"
        case 504:
            return "extreme rain"
        case 511:
            return "freezing rain"
        case 520:
            return "light shower rain"
        case 521:
            return "shower rain"
        case 522:
            return "heavy shower rain"
        case 531:
            return "ragged shower rain"
            
            
        case 600:
            return "light snow"
        case 601:
            return "snow"
        case 602:
            return "heavy snow"
        case 611:
            return "sleet"
        case 612:
            return "light shower snow"
        case 613:
            return "shower snow"
        case 615:
            return "light rain and snow"
        case 616:
            return "rain and snow"
        case 620:
            return "light shower snow"
        case 622:
            return "heavy shower snow"
            
            
        case 701...781:
            return "fog"
        case 800:
            return "clear sky"
        case 801:
            return "few clouds"
        case 802:
            return "scattered clouds"
        case 803...804:
            return "overcast clouds"
        default:
            return ""
        }
    }
}
