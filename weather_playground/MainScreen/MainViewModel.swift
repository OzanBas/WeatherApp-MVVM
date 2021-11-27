//
//  MainViewModel.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import UIKit
import CoreLocation
import MapKit

class MainViewModel : MainScreenProtocol {

    
   
    

    



    //Initialize Files.
    var mainVC : MainController
    let detailVC = DetailController()
    let weatherService = WeatherService()
    let detailVM = DetailsViewModel()
    
    init(mainVC : MainController) {
        self.mainVC = mainVC
        mainVC.mainDelegate = self
    }
    
    
    //MARK: - Actions
    
    //Delegate Calls API with User Request.
    func userDidAskCityData(for cityName: String) {
        //Execute API Call
        if cityName.count > 0 {
            print("DEBUG: Delegate requested API call.")
            weatherService.getCityCurrent(cityName: cityName) {
                
                //NOTE: Completion Handler Updates UI
                DispatchQueue.main.async {
                   
                    self.presentCurrentWeather()
                }
            }
            
            weatherService.getCityForecast(cityName: cityName) {
                
                DispatchQueue.main.async {
                    self.presentForecastInfo()
                    self.presentUpcomingDays()
                }
            }
        }
    }
    
    // - NOTE: viewDidLoad() triggers one-time location api call
    func userDidAskLocationData(lat: String, Lon: String) {
        weatherService.getLocationCurrent(lat: lat, lon: Lon) {
            DispatchQueue.main.async {
                self.presentCurrentWeather()
            }
        }
        weatherService.getLocationForecast(lat: lat, lon: Lon) {
            DispatchQueue.main.async {
                self.presentForecastInfo()
                self.presentUpcomingDays()
                self.mainVC.view.isHidden = false
            }
        }
    }
    
    func cardButtonTapped() {
        mainVC.showDetailViewController(detailVC, sender: self)
        
        DispatchQueue.main.async {
            if let safeData = self.weatherService.apiCurrentData {
                self.detailVM.presentDetails(detailVC: self.detailVC, data: safeData)
            }
            if let safeData = self.weatherService.apiHourlyData {
                self.detailVM.presentHourlyDetails(detailVC: self.detailVC, data: safeData)
            }
            
        }
        
    }
    
    
    func userDidAskCityHourly(for cityName: String) {
        weatherService.getCityHourly(cityName: cityName) {
            print("DEBUG: Fetching CityHourly Completed.")
        }
    }
    
    func userDidAskLocationHourly(lat: String, Lon: String) {
        weatherService.getLocationHourly(lat: lat, lon: Lon) {
            print("DEBUG: Fetching LocationHourly Completed.")
        }
    }
    

    //MARK: - Helpers
    

    
    func presentCurrentWeather() {
        mainVC.cityNameLabel.text = weatherService.apiCurrentData?.name
        
        let fetchedTemp = weatherService.apiCurrentData?.main.temp ?? 0.0
        mainVC.temperatureLabel.formatTemperature(temp: fetchedTemp, starting: "", ending: "")
        
        let conditionIcon = weatherService.apiCurrentData?.weather[0].conditionIcon
        mainVC.weatherImage.downloaded(from: "https://openweathermap.org/img/wn/\(conditionIcon ?? "01d")@4x.png")
        
        let conditionName = weatherService.apiCurrentData?.weather[0].conditionName
        mainVC.descriptionLabel.text = conditionName
        
        guard let weatherId = weatherService.apiCurrentData?.weather[0].id else { return }
        mainVC.backgroundImage.presentBackgroundImage(with: weatherId)
        
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
        
        mainVC.firstDayLabel.text = firstDay
        mainVC.secondDayLabel.text = secondDay
        mainVC.thirdDayLabel.text = thirdDay
        mainVC.fourthDayLabel.text = fourthDay
        mainVC.fifthDayLabel.text = fifthDay
        mainVC.sixthDayLabel.text = sixthDay
        mainVC.seventhDayLabel.text = seventDay
    }
    
    func presentForecastInfo() {
        
        func presenter(day: Int, image: UIImageView, maxLabel: UILabel, minLabel: UILabel) {
            image.downloaded(from: "https://openweathermap.org/img/wn/\(weatherService.apiForecastData?.list[day].weather[0].conditionIcon ?? "01d")@4x.png")
            let maxTemp = weatherService.apiForecastData?.list[day].temp.max ?? 0.0
            let minTemp = weatherService.apiForecastData?.list[day].temp.min ?? 0.0
            maxLabel.formatTemperature(temp: maxTemp, starting: "", ending: "")
            minLabel.formatTemperature(temp: minTemp, starting: "", ending: "")
        }
        
        presenter(day: 0, image: mainVC.firstDayImage, maxLabel: mainVC.firstMaxTempLabel, minLabel: mainVC.firstMinTempLabel)
        presenter(day: 1, image: mainVC.secondDayImage, maxLabel: mainVC.secondMaxTempLabel, minLabel: mainVC.secondMinTempLabel)
        presenter(day: 2, image: mainVC.thirdDayImage, maxLabel: mainVC.thirdMaxTempLabel, minLabel: mainVC.thirdMinTempLabel)
        presenter(day: 3, image: mainVC.fourthDayImage, maxLabel: mainVC.fourthMaxTempLabel, minLabel: mainVC.fourthMinTempLabel)
        presenter(day: 4, image: mainVC.fifthDayImage, maxLabel: mainVC.fifthMaxTempLabel, minLabel: mainVC.fifthMinTempLabel)
        presenter(day: 5, image: mainVC.sixthDayImage, maxLabel: mainVC.sixthMaxTempLabel, minLabel: mainVC.sixthMinTempLabel)
        presenter(day: 6, image: mainVC.seventhDayImage, maxLabel: mainVC.seventhMaxTempLabel, minLabel: mainVC.seventhMinTempLabel)
    }
}



