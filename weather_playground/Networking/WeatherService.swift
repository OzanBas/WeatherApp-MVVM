//
//  WeatherService.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import Foundation



class WeatherService {
    
    //MARK: - Properties
    
    let baseUrlForecast = "https://api.openweathermap.org/data/2.5/forecast/daily?"
    let baseUrlCurrent = "https://api.openweathermap.org/data/2.5/weather?"
    let baseUrlHourly = "https://api.openweathermap.org/data/2.5/forecast?"
    let unitsForecast = "&units=metric&cnt=7"
    let unitsCurrent = "&units=metric"
    let apiKey2 = "&appid=542ffd081e67f4512b705f89d2a611b2"
    let apiKey = "&appid=1a5989996ef933e195d38c59cc212e41"
    let apiKey3 = "50ef0a8f7c02e07c59e3d8e7cbe7e2e9"
    let hourlyApiSample = "http://api.openweathermap.org/data/2.5/forecast?q=london&appid=542ffd081e67f4512b705f89d2a611b2"

    var apiCurrentData : CurrentWeatherModel?
    var apiForecastData : ForecastWeatherModel?
    var apiHourlyData : HourlyForecastModel?
    
    //MARK: - Url Creators
    
    func getLocationCurrent(lat: String, lon: String, completionHandler: @escaping() -> Void)  {
        let locationOfUrl = "lat=\(lat)&lon=\(lon)"
        let locUrl = baseUrlCurrent + locationOfUrl + apiKey + unitsCurrent
        print(locUrl)
        print(locUrl)
        print(locUrl)
        print(locUrl)
        guard let requestUrl = URL(string: locUrl) else { return }
        //      SelfNote: completionHandler is inside CompletionFetcher
        currentWeatherFetcher(requestUrl: requestUrl) {
            completionHandler()
        }
    }
    
    func getLocationHourly(lat: String, lon: String, completionHandler: @escaping() -> Void)  {
        let locationOfUrl = "lat=\(lat)&lon=\(lon)"
        let locUrl = baseUrlHourly + locationOfUrl + apiKey

        guard let requestUrl = URL(string: locUrl) else { return }
        //      SelfNote: completionHandler is inside CompletionFetcher
        hourlyWeatherFetcher(requestUrl: requestUrl) {
            completionHandler()
        }
    }
    
    func getCityCurrent(cityName: String, completionHandler: @escaping() -> Void) {
        let city = "&q=\(cityName)"
        let cityUrl = baseUrlCurrent + apiKey + unitsCurrent + city
        guard let requestUrl = URL(string: cityUrl) else { return }
        //      SelfNote: completionHandler is inside CompletionFetcher
        currentWeatherFetcher(requestUrl: requestUrl) {
            completionHandler()
        }
    }
    
    func getCityHourly(cityName: String, completionHandler: @escaping() -> Void) {
        let city = "&q=\(cityName)"
        let cityUrl = baseUrlHourly + apiKey3 + city
        guard let requestUrl = URL(string: cityUrl) else { return }
        //      SelfNote: completionHandler is inside CompletionFetcher
        hourlyWeatherFetcher(requestUrl: requestUrl) {
            completionHandler()
        }
    }
    
    func getLocationForecast(lat: String, lon: String, completionHandler: @escaping() -> Void) {
        let locationOfUrl = "lat=\(lat)&lon=\(lon)"
        let locUrl = baseUrlForecast + locationOfUrl + apiKey2 + unitsForecast
       
        guard let requestUrl = URL(string: locUrl) else { return }
        //      SelfNote: completionHandler is inside CompletionFetcher
        forecastWeatherFetcher(requestUrl: requestUrl) {
            completionHandler()
        }
    }
    
    func getCityForecast(cityName: String ,completionHandler: @escaping() -> Void) {
        let city = "&q=\(cityName)"
        let cityUrl = baseUrlForecast + apiKey2 + unitsForecast + city
        guard let requestUrl = URL(string: cityUrl) else { return }
        //      SelfNote: completionHandler is inside CompletionFetcher
        forecastWeatherFetcher(requestUrl: requestUrl) {
            completionHandler()
        }
    }
    
    //MARK: - WeatherFetchers
    
    func hourlyWeatherFetcher(requestUrl: URL, completionFetcher: @escaping() -> Void) {

        //Start Session
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: requestUrl) { Data, _, Error in
            if Error != nil {
                print("DEBUG: hourly weather dataTask returned Error -> \(Error!.localizedDescription)")
                return
            }
            
            //Decode Data
            if let unwrappedData = Data {
                let decoder = JSONDecoder()
                do {
                    let fetchedData = try decoder.decode(HourlyForecastModel.self, from: unwrappedData)
                    self.apiHourlyData = fetchedData
                    completionFetcher()
                } catch {
                    print("DEBUG: Hourly Weather Failed decoding.")
                }
            }
        }
        dataTask.resume()
    }
    
    
    func currentWeatherFetcher(requestUrl: URL, completionFetcher: @escaping() -> Void) {

        //Start Session
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: requestUrl) { Data, _, Error in
            if Error != nil {
                print("DEBUG: current weather dataTask returned Error -> \(Error!.localizedDescription)")
                return
            }
            
            //Decode Data
            if let unwrappedData = Data {
                let decoder = JSONDecoder()
                do {
                    let fetchedData = try decoder.decode(CurrentWeatherModel.self, from: unwrappedData)
                    self.apiCurrentData = fetchedData
                    completionFetcher()
                } catch {
                    print("DEBUG: Current Weather Failed decoding.")
                }
            }
        }
        dataTask.resume()
    }
    
    
    
    func forecastWeatherFetcher(requestUrl: URL, completionFetcher: @escaping() -> Void) {

        //Start Session
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: requestUrl) { Data, _, Error in
            if Error != nil {
                print("DEBUG: current weather dataTask returned Error -> \(Error!.localizedDescription)")
                return
            }
            
            //Decode Data
            if let unwrappedData = Data {
                let decoder = JSONDecoder()
                do {
                    let fetchedData = try decoder.decode(ForecastWeatherModel.self, from: unwrappedData)
                    self.apiForecastData = fetchedData
                    completionFetcher()
                } catch {
                    print("DEBUG: forecast Failed decoding.")
                }
            }
        }
        dataTask.resume()
    }
}
    


