//
//  hourlyModel.swift
//  weather_playground
//
//  Created by Ozan Bas on 16.11.2021.
//

import UIKit

struct HourlyForecastModel: Decodable {
    let list : [HourlyModel]
}

struct HourlyModel : Decodable {
    let dt: Int
    let main: TempModel
    let weather: [WeatherModel]
    let dt_txt: String
}

struct TempModel: Decodable {
    let temp: Double
}

struct WeatherModel: Decodable {
    let icon: String
}
