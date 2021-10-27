//
//  WeatherService.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import Foundation



class CurrentWeatherService {
    
    let stolenAPI = "542ffd081e67f4512b705f89d2a611b2"
    let apiKey = "1a5989996ef933e195d38c59cc212e41"
    let apiUrl = "https://api.openweathermap.org/data/2.5/weather?appid=50ef0a8f7c02e07c59e3d8e7cbe7e2e9&units=metric"
    let locationBase = "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid=1a5989996ef933e195d38c59cc212e41"
    
    var apiData : CurrentWeatherModel?
    
    

    func getLocCurrentWeather() {
        
    }
    
    func getCityCurrentWeather(cityName : String, completionHandler: @escaping () -> Void) {
        //Create Url
        let cityUrl = "\(apiUrl)&q=\(cityName)"
        guard let requestUrl = URL(string: cityUrl) else { return }
        
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
                    self.apiData = fetchedData
                    completionHandler()
                } catch {
                    print("DEBUG: Current Weather Failed decoding.")
                }
            }
        }
        dataTask.resume()
    }
}
    


