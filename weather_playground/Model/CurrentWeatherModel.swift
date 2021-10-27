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
    

}

struct TemperatureModel: Decodable {
    let temp : Double
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
