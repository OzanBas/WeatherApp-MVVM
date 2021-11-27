//
//  MainController.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import UIKit
import CoreLocation



class MainController: UIViewController {

    //MARK: - Properties
    
    let deviceHeight = UIScreen.main.bounds.height
    let deviceWidth = UIScreen.main.bounds.width
    var sizeAdjuster : Float {
        switch deviceHeight {
        case 800...900:
            return 1
        case 700...799:
            return 0.82
        case 600...699:
            return 0.74
        case 500...599:
            return 0.63
        default:
            return 1
        }
    }
    
    var detailVM = DetailsViewModel()
    var mainDelegate: MainScreenProtocol?
    var locationManager = CLLocationManager()
    var deviceLat : String?
    var deviceLon : String?
    
    let backgroundImage : UIImageView = {
        let image = UIImageView()
        return image
    }()

    let appLogoLabel : UILabel = {
        let label = UILabel()
        label.setDimensions(height: UIScreen.main.bounds.height / 18 , width: UIScreen.main.bounds.height / 4.5)
        label.layer.cornerRadius = UIScreen.main.bounds.height / 36
        label.backgroundColor = .init(red: 8/255, green: 32/255, blue: 50/255, alpha: 0.3)
        label.text = "WeatherApp©"
        label.font = .boldSystemFont(ofSize: UIScreen.main.bounds.height / 40)
        label.textColor = .init(white: 1, alpha: 0.8)
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    let currentViewCard : UIView = {
        let view = UIView()
        view.setHeight(UIScreen.main.bounds.height / 5)
        view.backgroundColor = .init(red: 8/255, green: 32/255, blue: 50/255, alpha: 0.3)
        view.layer.cornerRadius = 10
        return view
    }()
    
    let forecastViewCard : UIView = {
        let view = UIView()
        view.backgroundColor = .init(red: 8/255, green: 32/255, blue: 50/255, alpha: 0.3)
        view.layer.cornerRadius = 10
        view.setHeight(UIScreen.main.bounds.height / 2.4)
        return view
    }()
    
    
    let requestTextField : UITextField = {
       let field = UITextField()
        field.borderStyle = .roundedRect
        field.returnKeyType = .go
        field.backgroundColor = .white
        field.setHeight(20 + UIScreen.main.bounds.height / 30)
        field.tintColor = .black
        field.placeholder = " Search City or State"
        
        return field
    }()
    
    let cityNameLabel : UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: UIScreen.main.bounds.height / 25)
        label.textColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true

        return label
    }()
    
    let temperatureLabel : UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: UIScreen.main.bounds.height / 25)
         label.textColor = .white
         label.textAlignment = .center
         label.adjustsFontSizeToFitWidth = true
         return label
    }()
    
    let weatherImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        image.setDimensions(height: UIScreen.main.bounds.width / 4, width: UIScreen.main.bounds.width / 4)
        return image
    }()
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10 + UIScreen.main.bounds.height / 96)
        label.textColor = .white
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let locationButton : UIButton = {
        let button = UIButton(type: .system)
        button.setDimensions(height: 40, width: 40)
        button.layer.cornerRadius = 40 / 2
        button.backgroundColor = .init(white: 1, alpha: 0.2)
        button.tintColor = .white
        button.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        button.imageView?.setDimensions(height: 30, width: 35)
            button.addTarget(self, action: #selector(locationButtonTapped), for: .touchUpInside)
        return button
    }()

    let currentCardButton : UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(currentCardButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    let firstDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let secondDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let thirdDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let fourthDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let fifthDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let sixthDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let seventhDayLabel : UILabel = {
        let label = UILabel()
        label.configureDayLabel(display: "")
        return label
    }()
    
    let firstDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let secondDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let thirdDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let fourthDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let fifthDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let sixthDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let seventhDayImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let firstMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let secondMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let thirdMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let fourthMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let fifthMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let sixthMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let seventhMaxTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        return label
    }()
    
    let firstMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let secondMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let thirdMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let fourthMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let fifthMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let sixthMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    let seventhMinTempLabel : UILabel = {
        let label = UILabel()
        label.configureDayTemp(display: "")
        label.textColor = .init(white: 1, alpha: 0.6)
        return label
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isHidden = true
        self.locationManager.requestAlwaysAuthorization()

        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            print("TRUE")
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestLocation()
        }
        
        configureUI()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
        
    //MARK: - Actions
    
    @objc func locationButtonTapped() {
        mainDelegate?.userDidAskLocationData(lat: deviceLat ?? "", Lon: deviceLon ?? "")
    }

    @objc func currentCardButtonTapped() {        
        mainDelegate?.cardButtonTapped()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        requestTextField.endEditing(true)
    }
    
    
    //MARK: - Helpers
    

    func configureUI() {
        
        let gradient = CAGradientLayer()

        gradient.colors = [UIColor.systemBlue.cgColor, UIColor.systemPurple.cgColor]
        gradient.locations = [0,1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        requestTextField.delegate = self
        
        view.addSubview(backgroundImage)
        backgroundImage.frame = view.frame
        backgroundImage.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        view.addSubview(locationButton)
        locationButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingRight: 22)
        
        view.addSubview(requestTextField)
        requestTextField.centerX(inView: view)
        requestTextField.centerY(inView: locationButton)
        requestTextField.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: locationButton.leftAnchor,
        paddingTop: 40, paddingLeft: 30, paddingRight: 10)
        
        
        view.addSubview(currentViewCard)
        currentViewCard.centerX(inView: view)
        currentViewCard.anchor(top: requestTextField.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingRight: 15)

        view.addSubview(forecastViewCard)
        forecastViewCard.centerX(inView: view)
        forecastViewCard.anchor(top: currentViewCard.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingRight: 15)
        
        
        currentViewCard.addSubview(cityNameLabel)
        cityNameLabel.anchor(top:currentViewCard.topAnchor, left: currentViewCard.leftAnchor, paddingTop: UIScreen.main.bounds.height / 28 ,paddingLeft: 22)
 

        
        
        currentViewCard.addSubview(weatherImage)
        weatherImage.anchor(bottom: currentViewCard.bottomAnchor, right: currentViewCard.rightAnchor , paddingBottom: 0, paddingRight: 22)
        
        
        currentViewCard.addSubview(temperatureLabel)
        temperatureLabel.anchor(top: currentViewCard.topAnchor, paddingTop: UIScreen.main.bounds.height / 28)
        temperatureLabel.centerX(inView: weatherImage)
        
        currentViewCard.addSubview(descriptionLabel)
        descriptionLabel.anchor(left: currentViewCard.leftAnchor, bottom: currentViewCard.bottomAnchor, right: weatherImage.leftAnchor, paddingLeft: 22, paddingBottom: UIScreen.main.bounds.height / 28, paddingRight: 10)
        
        currentViewCard.addSubview(currentCardButton)
        currentCardButton.anchor(top:currentViewCard.topAnchor, left: currentViewCard.leftAnchor,
                                 bottom: currentViewCard.bottomAnchor, right: currentViewCard.rightAnchor)
        
                
        let firstDayStackView = UIStackView(arrangedSubviews: [firstDayLabel,firstDayImage,firstMaxTempLabel,firstMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let secondDayStackView = UIStackView(arrangedSubviews: [secondDayLabel,secondDayImage,secondMaxTempLabel,secondMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let thirdDayStackView = UIStackView(arrangedSubviews: [thirdDayLabel,thirdDayImage,thirdMaxTempLabel,thirdMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let fourthDayStackView = UIStackView(arrangedSubviews: [fourthDayLabel,fourthDayImage,fourthMaxTempLabel,fourthMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let fifthDayStackView = UIStackView(arrangedSubviews: [fifthDayLabel,fifthDayImage,fifthMaxTempLabel,fifthMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let sixthDayStackView = UIStackView(arrangedSubviews: [sixthDayLabel,sixthDayImage,sixthMaxTempLabel,sixthMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let seventhDayStackView = UIStackView(arrangedSubviews: [seventhDayLabel,seventhDayImage,seventhMaxTempLabel,seventhMinTempLabel ])
        firstDayStackView.axis = .horizontal
        
        let forecastStackView = UIStackView(arrangedSubviews: [firstDayStackView,secondDayStackView,thirdDayStackView,fourthDayStackView,fifthDayStackView,sixthDayStackView,seventhDayStackView])
        forecastStackView.axis = .vertical
        forecastStackView.distribution = .fillEqually
        

        
        forecastViewCard.addSubview(forecastStackView)
        forecastStackView.anchor(top: forecastViewCard.topAnchor, left: forecastViewCard.leftAnchor, bottom: forecastViewCard.bottomAnchor, right: forecastViewCard.rightAnchor, paddingTop: 15, paddingLeft: 20, paddingBottom: 15, paddingRight: 20)
        
        
        
        view.addSubview(appLogoLabel)
        appLogoLabel.centerX(inView: view)
        appLogoLabel.anchor(top:forecastViewCard.bottomAnchor, paddingTop: 15)
    }
    
    

}

//MARK: - Extensions

extension MainController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return requestTextField.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
                
        guard let userText = requestTextField.text?.lowercased() else { return }
        
        let cityName = userText.replacingOccurrences(of: " ", with: "-")
        
        print("DEBUG: cityName: \(cityName)")
        mainDelegate?.userDidAskCityData(for: cityName)
        mainDelegate?.userDidAskCityHourly(for: cityName)
        requestTextField.text = ""
    }
}

extension MainController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            deviceLat = String(latitude)
            deviceLon = String(longitude)
            
            print("\(deviceLat ?? ""), \(deviceLon ?? "")")
            mainDelegate?.userDidAskLocationData(lat: deviceLat ?? "", Lon: deviceLon ?? "")
            mainDelegate?.userDidAskLocationHourly(lat: deviceLat ?? "", Lon: deviceLon ?? "")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("DEBUG: Location fetch failed. -> \(error.localizedDescription)")
    }
}
