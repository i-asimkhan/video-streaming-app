///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** Constants.swift **)
dev_shanghai
Copyright © 2019 dev_shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/
import Foundation
import UIKit

struct ApiErrorMessage {
    static let NoNetwork = NSLocalizedString("No internet connection!", comment: "")
}

struct Colors {

    static let gray             = UIColor.gray
    
    static let alternative1     = UIColor(red: 0.9255, green: 0.9373, blue: 0.9451, alpha: 1.0)
    static let alternative2     = UIColor(red: 0.9647, green: 0.9686, blue: 0.9725, alpha: 1.0)
    
    static let systemWhite      = UIColor.white
    static let systemClear      = UIColor.clear
    static let systemBlack      = UIColor.black
    static let systemRed        = UIColor.red
    static let systemGray       = UIColor.gray
    static let systemLightGray  = UIColor.lightGray
    static let systemDarkGray   = UIColor.darkGray
    

    static let DemoViewBgColor    = UIColor(named: "#44D9E7")
    static let NavbarBgColor    = UIColor(named: "#44D9E7")
    static let NavbarTintColor    = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)

    static let HomeViewBgColor    = UIColor.white

}

struct Fonts {

    static let Dubai_Bold      = UIFont(name: "Dubai-Bold", size: 21)
    static let Dubai_Light      = UIFont(name: "Dubai-Light", size: 17)
    static let Dubai_Medium      = UIFont(name: "Dubai-Medium", size: 17)
    static let Dubai_Regualr      = UIFont(name: "Dubai-Regular", size: 17)


}

struct AppURls {
    fileprivate static let url          = ""
    static let base                     = url + "/api/"

}


struct APIList {


}

struct AppConstants {

}


struct AppLanguages {

    static let ENGLISH          = "en"
    static let ARABIC           = "ar"


}
