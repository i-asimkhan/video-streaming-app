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
    fileprivate static let url          = "http://munawla-admin.com"
    static let base                     = url + "/api/"



    static let profileImages            = url + "/public/user_images/"
    static let filterImages             = url + "/public/app_filter_images/"
    static let awardImages              = url + "/public/awards_image/"
    static let postFiles                = url + "/public/post_files/"
    static let advertisements           = url + "/public/advertisments/"
    static let promoVideo               = url + "/public/promo_video/"
    static let contestFiles             = url + "/public/contest_files/"
    
    static let productImage             = url + "/public/mystore/product_image/"
    static let categoryImages           = url + "/public/mystore/category_image/"
}


struct APIList {

	static let loginAPI          = "login/loginuser/"
	static let registerAPI       = "login/registerUser/"
	static let sendConfirmationAPI       = "Two_way_verification/sendConformationCode/"
	static let loadProfile       = "profile/getprofiledetails/"
	static let updateProfile       = "login/changepassword/"

	static let getItemDetailsbyASIN = "Get_data_from_amazon/getDetailByAsian/"

}

struct AppConstants {

	static let CORE_DATA_MODEL = "VideoStreamingApplication"
	static let AMAZON_ITEM_RECORD_WISH_LIST = "wish_list"
	static let AMAZON_ITEM_RECORD_SHIPMENT_LIST = "shipment_list"


}


struct AppLanguages {

	static let ENGLISH          = "en"
	static let ARABIC           = "ar"


}
