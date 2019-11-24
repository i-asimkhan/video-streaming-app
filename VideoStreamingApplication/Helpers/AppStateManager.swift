///**
/**
munawlaApp
Created by: dev shanghai on 18/05/2019

(** AppStateManager.swift **)
Shoukat Ullah
Copyright © 2019 Shoukat Ullah. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation

class AppStateManager {

	static let instance = AppStateManager()
	private init() {}
	var webServices = WebServices()
	var validation = Validation()
	var coreDataUtility = CoreDataUtility.init(modelName: AppConstants.CORE_DATA_MODEL)

	var selectedTabIndex: Int!
	
	/*
	var checkMore = 0
	var checkImage = 0 //For clearing selected post Images array on viewwillAppear on CreatePostController
	*/

}

// Login/Signup
extension AppStateManager {

	// LogIn
	func logout() {
		UserDefaults.standard.removeObject(forKey: "isLoggedin")
		UserDefaults.standard.removeObject(forKey: "userId")
	}

	func login(userID : String) {
		UserDefaults.standard.setValue(true, forKey: "isLoggedin")
		UserDefaults.standard.setValue(userID, forKey: "userId")
	}

	func isUserLoggedin() -> Bool {

		if let data = UserDefaults.standard.value(forKey: "isLoggedin") as? Bool {

			return data
		} else { return false }
	}

	// Demo
	func isdemoCompleted() -> Bool {

		if let data = UserDefaults.standard.value(forKey: "demoCompleted") as? Bool {

			return data
		} else { return false }
	}

	func setdemoCompleted() {

		UserDefaults.standard.setValue(true, forKey: "demoCompleted")

	}

	// Remember User
	func setRememberUser(email : String, password: String) {

		UserDefaults.standard.setValue(email, forKey: "userEmail")
		UserDefaults.standard.setValue(password, forKey: "userPassword")
	}

	func removeRememberUser() {

		UserDefaults.standard.setValue(nil, forKey: "userEmail")
		UserDefaults.standard.setValue(nil, forKey: "userPassword")
	}

	func checkRememberUser() -> Bool {

		if (UserDefaults.standard.value(forKey: "userEmail") as? String) != nil {

			return true
		} else { return false }
	}

	func checkAndUpdateUserPassword(password : String) {

		if self.checkRememberUser() {

			UserDefaults.standard.setValue(password, forKey: "userPassword")
		}
	}

	func setPhoneNumber(phoneNumber : String) {

		UserDefaults.standard.setValue(phoneNumber, forKey: "userPhoneNumber")
	}

	func getPhoneNumber() -> String? {

		if let userPhoneNumber = (UserDefaults.standard.value(forKey: "userPhoneNumber") as? String) {

			return userPhoneNumber
		} else { return nil }

	}

	func setVerificationCode(VerificationCode : String) {

		UserDefaults.standard.setValue(VerificationCode, forKey: "userVerificationCode")
	}

	func getVerificationCode() -> String? {

		if let userVerificationCode = (UserDefaults.standard.value(forKey: "userVerificationCode") as? String) {

			return userVerificationCode
		} else { return nil }

	}

	func getUserId() -> String? {

		if let userID = (UserDefaults.standard.value(forKey: "userId") as? String) {

			return userID
		} else { return nil }

	}

	func getCurrentAppLanguage() -> String {

		if let appLanguage = (UserDefaults.standard.value(forKey: "appLanguage") as? String) {

			return appLanguage
		} else { return "" }

	}

	func setCurrentAppLanguage(language : String) {

		UserDefaults.standard.setValue(language, forKey: "appLanguage")

	}


	/*
	func deleteDevice(onCompletion:((_ receivedData:AnyObject?) -> Void)?){
		let param = ["user_id" : UserDefaults.standard.value(forKey: "userId") , "device_id": UserDefaults.standard.value(forKey: "deviceId")] as [String : AnyObject]

			Logger.logInfo(value: param)

	AppStateManager.instance.webServices.startConnectionWithPostType(getUrlString: "DeleteDevice", params: param) { (receivedData) in

			Logger.logInfo(value: receivedData)
			onCompletion?(receivedData)

		}
	}
	*/

	/*
	func adminDeactivateUserAccount(onCompletion: @escaping ((_ receivedData: AnyObject) -> Void)){

		if !(NetworkManager.sharedInstance.isConnected()){
			Utility.showAlert(title:"ShowUoff", message:ApiErrorMessage.NoNetwork, buttonTitles:["Ok"], completion :{ response in })
			return
		}
		AppStateManager.instance.webServices.startConnectionWithGetType(getUrlString: "UserAutoLogoutIfAdminDeactivate/" + String(describing: (UserDefaults.standard.value(forKey: "userId")!))) { (receivedData) in

			Logger.logInfo(value: receivedData)

			if AppStateManager.instance.webServices.responseCode == 1 {

				if String(describing: receivedData.value(forKey: "response")!) == "1" {
					onCompletion(receivedData)
				}
			}
		}
	}
	*/

	/*
	func autoLogoutFromOldDevice(onCompletion: @escaping ((_ receivedData: AnyObject) -> Void)){

		if !(NetworkManager.sharedInstance.isConnected()){
			Utility.showAlert(title:"ShowUoff", message:ApiErrorMessage.NoNetwork, buttonTitles:["Ok"], completion :{ response in })
			return
		}
		let param = ["user_id" : UserDefaults.standard.value(forKey: "userId") , "device_id": UserDefaults.standard.value(forKey: "deviceId")] as [String : AnyObject]

		Logger.logInfo(value: param)

		AppStateManager.instance.webServices.startConnectionWithPostType(getUrlString: "LogoutOldDeviceIfNewfound", params: param) { (receivedData) in

			Logger.logInfo(value: receivedData)

			if AppStateManager.instance.webServices.responseCode == 1 {

				if String(describing: receivedData.value(forKey: "response")!) == "1" {
					onCompletion(receivedData)
				}

			}
		}
	}
	*/
}
