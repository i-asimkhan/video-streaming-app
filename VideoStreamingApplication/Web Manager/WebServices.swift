///**
/**
munawlaApp
Created by: dev shanghai on 18/05/2019

(** WebServices.swift **)
Shoukat Ullah
Copyright © 2019 Shoukat Ullah. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation
import UIKit
import Alamofire
import SVProgressHUD
import ObjectMapper
import AlamofireObjectMapper

enum methodType {
	case POST,GET
}

class WebServices : NSObject {
    
	override init(){}

	var responseCode = 0;

	var connectionError = ""

	var serviceCount = 0


	// MARK:- GET- Request
	func get<T: AnyObject>(params: Dictionary<String, AnyObject>?, serviceName: String, serviceType: String, modelType: T.Type, userToken: String, success: @escaping (_ servicResponse: AnyObject) -> Void, fail: (_ error: NSError) -> Void) where T: Mappable {

		let manager = Alamofire.SessionManager.default

	manager.session.configuration.timeoutIntervalForRequest = 60
		
		SVProgressHUD.show()
		showNetworkIndicator()
		/*
		let user_token = UserDefaults.standard.string(forKey: "user_token")
		*/

		let headerPath =  "Bearer \(userToken)"
		let headers: HTTPHeaders = [
			"Authorization":  headerPath ,
			"Accept" : "application/json"
		]

		let Url = AppURls.base + serviceName

		Alamofire.request(Url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<T>) in

			self.hideNetworkIndicator()
			switch response.result {
			case .success(let objectData):
				print(objectData)
				SVProgressHUD.dismiss()


				success(objectData)
				break
			case .failure(let error):
				SVProgressHUD.dismiss()

				print(error.localizedDescription)
			}
		}
	}

	func get<T: AnyObject>(params: Dictionary<String, AnyObject>?, serviceName: String, serviceType: String, modelType: T.Type, success: @escaping (_ servicResponse: AnyObject) -> Void, fail: (_ error: NSError) -> Void) where T: Mappable {

		let manager = Alamofire.SessionManager.default

	manager.session.configuration.timeoutIntervalForRequest = 60
		SVProgressHUD.show()

		showNetworkIndicator()
		let Url = AppURls.base + serviceName

		Alamofire.request(Url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: nil).responseObject { (response: DataResponse<T>) in
			self.hideNetworkIndicator()
			switch response.result {
			case .success(let objectData):
				print(objectData)
				SVProgressHUD.dismiss()


				success(objectData)
				break
			case .failure(let error):
				SVProgressHUD.dismiss()

				print(error.localizedDescription)
			}
		}
	}


	// MARK:- POST- Request
	func post<T: AnyObject>(params: Dictionary<String, AnyObject>, serviceName: String, isLoaderShow : Bool , serviceType: String, modelType: T.Type, success: @escaping ( _ servicResponse: AnyObject) -> Void, fail: @escaping ( _ error: NSError) -> Void, showHUD: Bool)  where T: Mappable {


		let manager = Alamofire.SessionManager.default
		manager.session.configuration.timeoutIntervalForRequest = 60

		let Url = AppURls.base + serviceName

		showNetworkIndicator()
		if showHUD {
			SVProgressHUD.show()
		}

		Alamofire.request(Url, method:.post, parameters: params)
			.validate()
			.responseObject { (response: DataResponse<T>) in

				self.hideNetworkIndicator()

				switch response.result {

				case.success(let objectData):
					print(response.result)
					SVProgressHUD.dismiss()

					
					/*
					guard (try? objectData) != nil else {
						return
					}
					*/

					do {

						let FULLResponse =
							try JSONDecoder().decode(loginDC.self, from: response.data!)

					} catch let jsonerror {

					}


					success(objectData)

				case.failure(let error):
					print(error.localizedDescription)
					SVProgressHUD.dismiss()
					fail(error as NSError)
				}
		}
	}

	func post<T: AnyObject>(params: Dictionary<String, AnyObject>, serviceName: String, isLoaderShow : Bool , serviceType: String, modelType: T.Type, userToken: String, success: @escaping ( _ servicResponse: AnyObject) -> Void, fail: @escaping ( _ error: NSError) -> Void, showHUD: Bool)  where T: Mappable {


		if showHUD {
			SVProgressHUD.show()
		}


		let Url = AppURls.base + serviceName

		var headers: HTTPHeaders = [:]
		if userToken != "" {

			let headerPath =  "Bearer \(userToken)"
			headers = [
				"Authorization":  headerPath ,
				"Accept" : "application/json"
			]

		} else {

			headers = [
				"Accept" : "application/json"
			]

		}

		let manager = Alamofire.SessionManager.default
		manager.session.configuration.timeoutIntervalForRequest = 60

		showNetworkIndicator()

		Alamofire.request(Url, method: .post, parameters: params, encoding: URLEncoding.httpBody, headers: headers).validate().responseObject { (response : DataResponse<T>) in
			self.hideNetworkIndicator()

			switch response.result {

			case.success(let objectData):
				print(response.result)
				SVProgressHUD.dismiss()
				success(objectData)
			case.failure(let error):
				print(error.localizedDescription)
				SVProgressHUD.dismiss()
				fail(error as NSError)
			}

		}
	}


	func showNetworkIndicator() {
		UIApplication.shared.isNetworkActivityIndicatorVisible = true
			  serviceCount += 1
	}

	func hideNetworkIndicator() {
		serviceCount -= 1
		if serviceCount == 0 {
			UIApplication.shared.isNetworkActivityIndicatorVisible = false
		}
	}

}
