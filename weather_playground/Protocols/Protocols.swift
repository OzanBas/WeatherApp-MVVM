//
//  Protocols.swift
//  weather_playground
//
//  Created by Ozan Bas on 10.11.2021.
//

import Foundation
import UIKit

protocol MainScreenProtocol {
    func userDidAskForData(for cityName: String)
    func firstTimeLocationUpdate(lat: String, Lon: String)
    func userDidAskForDetails()
}

protocol DetailsScreenProtocol {
    func userDidAskForDetails()
}
