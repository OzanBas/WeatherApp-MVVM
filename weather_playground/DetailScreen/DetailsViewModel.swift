//
//  DetailViewController.swift
//  weather_playground
//
//  Created by Ozan Bas on 10.11.2021.
//

import Foundation
import UIKit


class DetailsViewModel  {

        
    
    func presentDetails(detailVC: DetailController, data : CurrentWeatherModel) {
        
        
        detailVC.backgroundImage.presentBackgroundImage(with: data.weather[0].id)
        
        let conditionIcon = data.weather[0].conditionIcon
        detailVC.weatherImage.downloaded(from: "https://openweathermap.org/img/wn/\(conditionIcon)@4x.png")
        
        detailVC.tempLabel.formatTemperature(temp: data.main.temp, starting: "", ending: "")
        
        detailVC.visibilityLabel.text = String(data.visibility)
        
        let pressure = Int(data.main.pressure)
        detailVC.pressureLabel.text = String(pressure)
        
        let humidity = Int(data.main.humidity)
        detailVC.humidityLabel.text = String(humidity)
        
        detailVC.windDirectionLabel.text = data.wind.windDirection
        
        detailVC.minTempLabel.formatTemperature(temp: data.main.temp_min, starting: "Min:", ending: "")
        detailVC.maxTempLabel.formatTemperature(temp: data.main.temp_max, starting: "Max:", ending: "")
        detailVC.feelsLikeLabel.formatTemperature(temp: data.main.feels_like, starting: "feels like:", ending: "")
        detailVC.cityNameLabel.text = data.name
        
        detailVC.windSpeedLabel.text = String(data.wind.speed)

        detailVC.cloudsLabel.text = String(data.clouds.all)
        
        
    }
    
    func presentHourlyDetails(detailVC: DetailController, data: HourlyForecastModel) {
        
        func presenter(list: Int, hourLabel: UILabel, hourImage: UIImageView, hourTemp: UILabel) {
            let time1 = data.list[list].dt_txt
            
            hourLabel.sliceTime(dt: time1)
            let condition1 = data.list[list].weather[0].icon
            hourImage.downloaded(from: "https://openweathermap.org/img/wn/\(condition1)@2x.png")
            let temp1 = data.list[list].main.temp
            hourTemp.formatTemperature(temp: temp1, starting: "", ending: "")
            
            print("\(time1),\(condition1),\(temp1)")
            
        }
        
        presenter(list: 0, hourLabel: detailVC.hourLabel1, hourImage: detailVC.hourImage1, hourTemp: detailVC.hourTemp1)
        presenter(list: 1, hourLabel: detailVC.hourLabel2, hourImage: detailVC.hourImage2, hourTemp: detailVC.hourTemp2)
        presenter(list: 2, hourLabel: detailVC.hourLabel3, hourImage: detailVC.hourImage3, hourTemp: detailVC.hourTemp3)
        presenter(list: 3, hourLabel: detailVC.hourLabel4, hourImage: detailVC.hourImage4, hourTemp: detailVC.hourTemp4)
        presenter(list: 4, hourLabel: detailVC.hourLabel5, hourImage: detailVC.hourImage5, hourTemp: detailVC.hourTemp5)
        presenter(list: 5, hourLabel: detailVC.hourLabel6, hourImage: detailVC.hourImage6, hourTemp: detailVC.hourTemp6)


    }
}
