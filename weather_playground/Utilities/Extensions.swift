//
//  Extensions.swift
//  weather_playground
//
//  Created by Ozan Bas on 22.10.2021.
//

import UIKit


//MARK: - Contrains helper
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func center(inView view: UIView, yConstant: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yConstant!).isActive = true
    }
    
    func centerX(inView view: UIView, topAnchor: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        if let topAnchor = topAnchor {
            self.topAnchor.constraint(equalTo: topAnchor, constant: paddingTop!).isActive = true
        }
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }
    
    func setDimensions(height: CGFloat, width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setHeight(_ height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(_ width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func fillSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        guard let view = superview else { return }
        anchor(top: view.topAnchor, left: view.leftAnchor,
               bottom: view.bottomAnchor, right: view.rightAnchor)
    }
}

//MARK: - Image downloader

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    func presentBackgroundImage(with id: Int){
        
        func picSelector() -> String {
            
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
        self.image = UIImage(imageLiteralResourceName: picSelector())
    }
    
    func configureHourImage(){
        contentMode = .scaleAspectFit
//        setDimensions(height: 30, width: 30)
    }
}


//MARK: - Refactor Helper Functions

extension UILabel {
    
    func sliceTime(dt: String) {
        let dt2 = dt.dropLast(3)
        let dt3 = dt2.suffix(5)
        self.text = String(dt3)
    }
    
    func configureHourLabel() {
        font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 224)
        textColor = .white
    }
    
    func configureHourTemp() {
        font = .boldSystemFont(ofSize: 10 + UIScreen.main.bounds.height / 224)
        textColor = .white
    }
    
    func configureDayLabel(display: String) {
        textColor = .init(white: 1, alpha: 1)
        font = .systemFont(ofSize: 10 + UIScreen.main.bounds.height / 100)
        setWidth(120)
        text = display
    }
    
    func configureDayTemp(display: String) {
        font = .boldSystemFont(ofSize: 10 + (UIScreen.main.bounds.height / 130))
        textColor = .init(white: 1, alpha: 1)
        setWidth(50)
        textAlignment = .center
        text = display
    }
    
    func formatTemperature(temp: Double, starting: String, ending: String) {
        if temp < 100 {
            let formattedTemp = String(format: "%.1f", temp)
            let newTemp = "\(starting) \(formattedTemp)° \(ending)"
            self.text = newTemp
        } else {
            let converted = temp - 273.2
            let formattedTemp = String(format: "%.1f", converted)
            let newTemp = "\(starting) \(formattedTemp)° \(ending)"
            self.text = newTemp
        }
    }
}


