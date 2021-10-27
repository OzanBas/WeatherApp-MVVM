//
//  ForecastWeatherService.swift
//  weather_playground
//
//  Created by Ozan Bas on 25.10.2021.
//

import Foundation



class ForecastWeatherService {
    
    let stolenAPI = "542ffd081e67f4512b705f89d2a611b2"
    let apiUrl = "https://api.openweathermap.org/data/2.5/forecast/daily?q="
    let apiUrlLastPart = "&units=metric&cnt=7&appid=542ffd081e67f4512b705f89d2a611b2"
    
    
    var apiData : ForecastWeatherModel?
    
    
    func getCityForecastWeather(cityName : String, completionHandler: @escaping () -> Void) {
        //Create Url
        let cityUrl = "\(apiUrl)\(cityName)\(apiUrlLastPart)"
        guard let requestUrl = URL(string: cityUrl) else { return }
        
        //Start Session
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: requestUrl) { Data, _, Error in
            if Error != nil {
                print("DEBUG: forecast dataTask returned Error -> \(Error!.localizedDescription)")
                return
            }
            
            //Decode Data
            if let unwrappedData = Data {
                let decoder = JSONDecoder()
                do {
                    let fetchedData = try decoder.decode(ForecastWeatherModel.self, from: unwrappedData)
                    self.apiData = fetchedData
                    completionHandler()
                } catch {
                    print("DEBUG: forecast Failed decoding.")
                }
            }
        }
        dataTask.resume()
    }
}

