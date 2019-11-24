///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** AppStateManager.swift **)
dev_shanghai
Copyright © 2019 dev_shanghai. All rights reserved.

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
}
