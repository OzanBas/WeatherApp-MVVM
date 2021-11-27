//
//  Protocols.swift
//  weather_playground
//
//  Created by Ozan Bas on 10.11.2021.
//

import Foundation
import UIKit

protocol MainScreenProtocol {
    func userDidAskCityData(for cityName: String)
    func userDidAskLocationData(lat: String, Lon: String)
    func userDidAskCityHourly(for cityName: String)
    func userDidAskLocationHourly(lat: String, Lon: String)
    
    func cardButtonTapped()
}



