//
//  MainViewModel.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import UIKit
import CoreLocation
import MapKit

class MainViewModel : MainControllerProtocol {
    

    //Initialize Files.
    let view : MainController?
    let currentService = CurrentWeatherService()
    let forecastService = ForecastWeatherService()
    
    init() {
        view = MainController()
        view?.delegate = self
    }
    

    
    
    //Delegate Calls API with User Request.
    func userDidAskForData(for cityName: String) {
        //Execute API Call
        print("DEBUG: Delegate is ready.")
        
        if cityName.count > 0 {
            print("DEBUG: Delegate requested API call.")
            currentService.getCityCurrentWeather(cityName: cityName) {
                
                //NOTE: Completion Handler Updates UI
                DispatchQueue.main.async {
                   
                    self.presentCurrentWeather()
                }
            }
            
            forecastService.getCityForecastWeather(cityName: cityName) {
                
                DispatchQueue.main.async {
                    self.presentForecastInfo()
                    self.presentUpcomingDays()
                }
            }
            
        }
    }
    
    //MARK: - Helpers
    
    func formatTemperature(temp: Double) -> String {
        let formattedTemp = String(format: "%.1f", temp)
        let newTemp = "\(formattedTemp) °"
        return newTemp
    }
    
    func presentCurrentWeather() {
        view?.cityNameLabel.text = currentService.apiData?.name
        
        let fetchedTemp = currentService.apiData?.main.temp ?? 0.0
        view?.temperatureLabel.text = formatTemperature(temp: fetchedTemp)
        
        let conditionIcon = currentService.apiData?.weather[0].conditionIcon
        view?.weatherImage.downloaded(from: "https://openweathermap.org/img/wn/\(conditionIcon ?? "01d")@4x.png")
        
        let conditionName = currentService.apiData?.weather[0].conditionName
        view?.descriptionLabel.text = conditionName
        
        guard let weatherId = currentService.apiData?.weather[0].id else { return }
        view?.backgroundImage.image = UIImage(imageLiteralResourceName: "\(presentBackgroundImage(for: weatherId))")
        
    }
    
    
    func presentUpcomingDays() {
        let day : Double = 86400
        func getDayName(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat  = "EEEE" // "EE" to get short style
            let dayInWeek = dateFormatter.string(from: date) // "Sunday"
            return dayInWeek
        }
        let firstDay = getDayName(date: Date(timeIntervalSinceNow: day))
        let secondDay = getDayName(date: Date(timeIntervalSinceNow: day*2))
        let thirdDay = getDayName(date: Date(timeIntervalSinceNow: day*3))
        let fourthDay = getDayName(date: Date(timeIntervalSinceNow: day*4))
        let fifthDay = getDayName(date: Date(timeIntervalSinceNow: day*5))
        let sixthDay = getDayName(date: Date(timeIntervalSinceNow: day*6))
        let seventDay = getDayName(date: Date(timeIntervalSinceNow: day*7))
        
        view?.firstLabel.text = firstDay
        view?.secondLabel.text = secondDay
        view?.thirdLabel.text = thirdDay
        view?.fourthLabel.text = fourthDay
        view?.fifthLabel.text = fifthDay
        view?.sixthLabel.text = sixthDay
        view?.seventhLabel.text = seventDay
    }
    
    func presentForecastInfo() {
        view?.firstImage.downloaded(from: "https://openweathermap.org/img/wn/\(forecastService.apiData?.list[0].weather[0].conditionIcon ?? "01d")@4x.png")
        view?.firstTempLabel.text = formatTemperature(temp: forecastService.apiData?.list[0].temp.max ?? 0.0)
        
        view?.secondImage.downloaded(from: "https://openweathermap.org/img/wn/\(forecastService.apiData?.list[1].weather[0].conditionIcon ?? "01d")@4x.png")
        view?.secondTempLabel.text = formatTemperature(temp: forecastService.apiData?.list[1].temp.max ?? 0.0)
        
        view?.thirdImage.downloaded(from: "https://openweathermap.org/img/wn/\(forecastService.apiData?.list[2].weather[0].conditionIcon ?? "01d")@4x.png")
        view?.thirdTempLabel.text = formatTemperature(temp: forecastService.apiData?.list[2].temp.max ?? 0.0)
        
        view?.fourthImage.downloaded(from: "https://openweathermap.org/img/wn/\(forecastService.apiData?.list[3].weather[0].conditionIcon ?? "01d")@4x.png")
        view?.fourthTempLabel.text = formatTemperature(temp: forecastService.apiData?.list[3].temp.max ?? 0.0)
        
        view?.fifthImage.downloaded(from: "https://openweathermap.org/img/wn/\(forecastService.apiData?.list[4].weather[0].conditionIcon ?? "01d")@4x.png")
        view?.fifthTempLabel.text = formatTemperature(temp: forecastService.apiData?.list[4].temp.max ?? 0.0)
        
        view?.sixthImage.downloaded(from: "https://openweathermap.org/img/wn/\(forecastService.apiData?.list[5].weather[0].conditionIcon ?? "01d")@4x.png")
        view?.sixthTempLabel.text = formatTemperature(temp: forecastService.apiData?.list[5].temp.max ?? 0.0)
        
        view?.seventhImage.downloaded(from: "https://openweathermap.org/img/wn/\(forecastService.apiData?.list[6].weather[0].conditionIcon ?? "01d")@4x.png")
        view?.seventhTempLabel.text = formatTemperature(temp: forecastService.apiData?.list[6].temp.max ?? 0.0)
        
    }
    
    func presentBackgroundImage(for id: Int) -> String{
        
        switch id {
        case 200...232:
            return "thunder.1"
        case 300...321:
            return "rain.1"
        case 500...531:
            return "rain.2"
        case 600...622:
            return "snow.1"
        case 701...781:
            return "fog.1"
        case 800:
            return "clear.sky"
        case 801:
            return "few.clouds"
        case 802:
            return "heavy.clouds"
        case 803...804:
            return "heavy.clouds"
        default:
            return "clear.sky"
            
            
        }
    }
    
}



