//
//  Extensions.swift
//  SunAndSet
//
//  Created by User on 6/14/18.
//  Copyright © 2018 clueapps. All rights reserved.
//


import Foundation
import UIKit
var showLoadingMainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

//extension UIViewController{
//    func alertUser(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil){
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: completion)
//        alert.addAction(okAction)
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    func alertIfUserNotLoggedIn(){
//        let alert = UIAlertController(title: "Sorry", message: "you are not logged in yet, please make sure to logIn", preferredStyle: .alert)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
//        let logInAction = UIAlertAction(title: "logIn", style: .default) { (action) in
//            Root.toLoginVC(withVC: self)
//        }
//
//        alert.addAction(cancelAction)
//        alert.addAction(logInAction)
//        self.present(alert, animated: true, completion: nil)
//    }
//
//    func alertToGoToSettings(title: String, message: String) {
//        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment:"" ), style: .default, handler: { action in
//            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
//        })
//        controller.addAction(cancelAction)
//        controller.addAction(settingsAction)
//        present(controller, animated: true, completion: nil)
//    }
//
//
//    func showLoading(_ title: String = "Loading..."){
//
//        if view.subviews.contains(showLoadingMainView){
//            return
//        }
//
//        showLoadingMainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//        showLoadingMainView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
//
//        let popUpView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
//        popUpView.backgroundColor = UIColor.white
//        popUpView.clipsToBounds = true
//        popUpView.roundView(withCorner: 16)
//
//        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
//        activityIndicator.activityIndicatorViewStyle = .whiteLarge
//        activityIndicator.color = UIColor.mainColor()
//
//        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
//        labelTitle.text = title
//        labelTitle.textColor = UIColor.black
//        labelTitle.textAlignment = .center
//        labelTitle.font = UIFont.josefinSansSemiBoldItalic(size: 18)
//        labelTitle.numberOfLines = 3
//
//
//
//        view.addSubview(showLoadingMainView)
//        showLoadingMainView.addSubview(popUpView)
//        popUpView.addSubview(activityIndicator)
//        popUpView.addSubview(labelTitle)
//
//        showLoadingMainView.translatesAutoresizingMaskIntoConstraints = false
//        showLoadingMainView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
//        showLoadingMainView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
//        showLoadingMainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        showLoadingMainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//
//        popUpView.translatesAutoresizingMaskIntoConstraints = false
//        popUpView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        popUpView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        popUpView.centerYAnchor.constraint(equalTo: showLoadingMainView.centerYAnchor).isActive = true
//        popUpView.centerXAnchor.constraint(equalTo: showLoadingMainView.centerXAnchor).isActive = true
//
//        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//        activityIndicator.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
//        activityIndicator.centerYAnchor.constraint(equalTo: popUpView.centerYAnchor, constant: -18).isActive = true
//
//        labelTitle.translatesAutoresizingMaskIntoConstraints = false
//        labelTitle.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 18).isActive = true
//        labelTitle.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 4).isActive = true
//        labelTitle.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: 4).isActive = true
//
//        activityIndicator.startAnimating()
//        self.navigationController?.navigationBar.isUserInteractionEnabled = false
//        self.tabBarController?.tabBar.isUserInteractionEnabled = false
//    }
//
//    func hideLoading(){
//        self.navigationController?.navigationBar.isUserInteractionEnabled = true
//        self.tabBarController?.tabBar.isUserInteractionEnabled = true
//        showLoadingMainView.removeFromSuperview()
//    }
//
//
//
//
//
//
//}

extension UIView{
    func roundView(withCorner radius: CGFloat, borderColor: UIColor = .clear, borderWidth: CGFloat = 0){
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
    }
    
    func makeShadow(withCorner radius: CGFloat, borderColor: UIColor = .clear, borderWidth: CGFloat = 0, shadowColor: UIColor, shadowOffset: CGSize, shadowRadius: CGFloat, shadowOpacity: Float){
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    func makeShadowWithOutMasks(withCorner radius: CGFloat, borderColor: UIColor = .clear, borderWidth: CGFloat = 0, shadowColor: UIColor, shadowOffset: CGSize, shadowRadius: CGFloat, shadowOpacity: Float){
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        
        layer.cornerRadius = radius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    func makeDashLine(){
        let  path = UIBezierPath()
        
        let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
        path.move(to: p0)
        
        let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
        path.addLine(to: p1)
        
        let  dashes: [ CGFloat ] = [ 16.0, 32.0 ]
        path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        path.lineWidth = 8.0
        path.lineCapStyle = .butt
        UIColor.red.set()
        path.stroke()
        
        //
        //        let  context: CGContext = UIGraphicsGetCurrentContext()!
        //
        //        let  p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
        //        context.move(to: p0)
        //
        //        let  p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
        //        context.move(to: p1)
        //
        //        let  dashes: [ CGFloat ] = [ 16.0, 32.0 ]
        //        context.setLineDash(phase: 0.0, lengths: dashes)
        //
        //        context.setLineWidth(8.0)
        //        context.setLineCap(.butt)
        //
        //
        //        UIColor.blue.set()
        //        context.strokePath()
    }
}

extension UIColor{
    class func mainColor() -> UIColor{
        return UIColor(red: 97/255, green: 184/255, blue: 212/255, alpha: 1)
    }
}

public enum ImageFormat {
    case png
    case jpeg(CGFloat)
}

extension UIImage {
    
    public func base64(format: ImageFormat) -> String? {
        var imageData: Data?
        switch format {
        case .png: imageData = UIImagePNGRepresentation(self)
        case .jpeg(let compression): imageData = UIImageJPEGRepresentation(self, compression)
        }
        return imageData?.base64EncodedString()
    }
}
extension UILabel {
    
    var substituteFontName : String  {
        get { return self.font.fontName }
        set { self.font = UIFont(name: newValue, size: (self.font.pointSize))
            
        }
    }
    
}
//extension UILabel{
//    var defaultFont: UIFont? {
//        get { return self.font }
//        set { self.font = newValue }
//    }
//}
extension UIFont{
    class func OpenSansBold(size: CGFloat) -> UIFont{
        if let font = UIFont(name: Constants.Fonts.OpenSansBold, size: size){
            return font
        }else{
            return UIFont()
        }
    }
   
    class func OpenSansLight(size: CGFloat) -> UIFont{
        if let font = UIFont(name: Constants.Fonts.OpenSansLight, size: size){
            return font
        }else{
            return UIFont()
        }
    }
    
    
    class func OpenSansRegular(size: CGFloat) -> UIFont{
        if let font = UIFont(name: Constants.Fonts.OpenSansRegular, size: size){
            return font
        }else{
            return UIFont()
        }
    }
    
    class func OpenSansSemiBold(size: CGFloat) -> UIFont{
        if let font = UIFont(name: Constants.Fonts.OpenSansSemiBold, size: size){
            return font
        }else{
            return UIFont()
        }
    }
    
    
    
    class func OpenSansExtraBold(size: CGFloat) -> UIFont{
        if let font = UIFont(name: Constants.Fonts.OpenSansExtraBold, size: size){
            return font
        }else{
            return UIFont()
        }
    }
    
    
}


extension String {
    func validateEmail() -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
        
    }
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}


public extension UIDevice {
    
    static let modelName: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        func mapToDevice(identifier: String) -> String { // swiftlint:disable:this cyclomatic_complexity
            #if os(iOS)
            switch identifier {
            case "iPod5,1":                                 return "iPod Touch 5"
            case "iPod7,1":                                 return "iPod Touch 6"
            case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
            case "iPhone4,1":                               return "iPhone 4s"
            case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
            case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
            case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
            case "iPhone7,2":                               return "iPhone 6"
            case "iPhone7,1":                               return "iPhone 6 Plus"
            case "iPhone8,1":                               return "iPhone 6s"
            case "iPhone8,2":                               return "iPhone 6s Plus"
            case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
            case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
            case "iPhone8,4":                               return "iPhone SE"
            case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
            case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
            case "iPhone10,3", "iPhone10,6":                return "iPhone X"
            case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
            case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
            case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
            case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
            case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
            case "iPad6,11", "iPad6,12":                    return "iPad 5"
            case "iPad7,5", "iPad7,6":                      return "iPad 6"
            case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
            case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
            case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
            case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
            case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
            case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
            case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
            case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
            case "AppleTV5,3":                              return "Apple TV"
            case "AppleTV6,2":                              return "Apple TV 4K"
            case "AudioAccessory1,1":                       return "HomePod"
            case "i386", "x86_64":                          return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "iOS"))"
            default:                                        return identifier
            }
            #elseif os(tvOS)
            switch identifier {
            case "AppleTV5,3": return "Apple TV 4"
            case "AppleTV6,2": return "Apple TV 4K"
            case "i386", "x86_64": return "Simulator \(mapToDevice(identifier: ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] ?? "tvOS"))"
            default: return identifier
            }
            #endif
        }
        
        return mapToDevice(identifier: identifier)
    }()
}


extension UIImageView{
    func addImage(withImage image: String?, andPlaceHolder holder: String){
        let placeHolder = UIImage(named: holder)!
        if let imageURL = URL(string: image ?? ""){
            self.sd_setImage(with: imageURL, placeholderImage: placeHolder, options: [], completed: { (_, error,_ , _) in
                if error != nil{
                    self.image = placeHolder
                }
            })
        }else{
            self.image = placeHolder
        }
    }
   
    }

extension UIViewController{
    
//    func GetMainView() -> UIView
//    {
////        let x : UIViewController
//////        let view =  UIViewController()
//////        view.ta
////        if (x  is UITabBar)
////        {return }
////        if let wd = self.view.window {
////            let vc = wd.rootViewController!
////            if(vc is UITabBar){
////           return vc
////
////    }
////            else{
////                return UIView}
////
////        }    }
    func alertUser(title: String, message: String, completion: ((UIAlertAction) -> Void)? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: completion)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertIfUserNotLoggedIn(){
        let alert = UIAlertController(title: "Sorry", message: "you are not logged in yet, please make sure to logIn", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let logInAction = UIAlertAction(title: "logIn", style: .default) { (action) in
            RootView.toLoginVC(withVC: self, title: "Login")
        }
        
        alert.addAction(cancelAction)
        alert.addAction(logInAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertToGoToSettings(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let settingsAction = UIAlertAction(title: NSLocalizedString("Settings", comment:"" ), style: .default, handler: { action in
            UIApplication.shared.open(URL(string: UIApplicationOpenSettingsURLString)!, options: [:], completionHandler: nil)
        })
        controller.addAction(cancelAction)
        controller.addAction(settingsAction)
        present(controller, animated: true, completion: nil)
    }
    func showLoading(_ title: String = "Loading..."){
        
        if view.subviews.contains(showLoadingMainView){
            return
        }
        
        showLoadingMainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        showLoadingMainView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        
        let popUpView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 150))
        popUpView.backgroundColor = UIColor.white
        popUpView.clipsToBounds = true
        popUpView.roundView(withCorner: 16)
        
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.color = UIColor.mainColor()
        
        let labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        labelTitle.text = title
        labelTitle.textColor = UIColor.black
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.OpenSansSemiBold(size: 18)
        labelTitle.numberOfLines = 3
        
        
        
        view.addSubview(showLoadingMainView)
        showLoadingMainView.addSubview(popUpView)
        popUpView.addSubview(activityIndicator)
        popUpView.addSubview(labelTitle)
        
        showLoadingMainView.translatesAutoresizingMaskIntoConstraints = false
        showLoadingMainView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        showLoadingMainView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        showLoadingMainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        showLoadingMainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        popUpView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        popUpView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        popUpView.centerYAnchor.constraint(equalTo: showLoadingMainView.centerYAnchor).isActive = true
        popUpView.centerXAnchor.constraint(equalTo: showLoadingMainView.centerXAnchor).isActive = true
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: popUpView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: popUpView.centerYAnchor, constant: -18).isActive = true
        
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor, constant: 18).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: popUpView.leadingAnchor, constant: 4).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: popUpView.trailingAnchor, constant: 4).isActive = true
        
        activityIndicator.startAnimating()
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
        self.tabBarController?.tabBar.isUserInteractionEnabled = false
    }
    
    func hideLoading(){
        self.navigationController?.navigationBar.isUserInteractionEnabled = true
        self.tabBarController?.tabBar.isUserInteractionEnabled = true
        showLoadingMainView.removeFromSuperview()
    }
}

