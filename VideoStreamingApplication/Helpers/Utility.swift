///**
/**
munawlaApp
Created by: dev shanghai on 19/05/2019

(** Utility.swift **)
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
import SwiftEntryKit

class Utility {
    class func removeNullFromJSONData(_ JSONData: Any) -> Any {
        if JSONData as? NSNull != nil {
            return JSONData
        }

        var JSONObject: Any!

        if JSONData as? NSData != nil {
            JSONObject = try! JSONSerialization.data(withJSONObject: JSONData, options: JSONSerialization.WritingOptions.prettyPrinted)
        }
        else {
            JSONObject = JSONData
        }

        if JSONObject as? NSArray != nil {
            let mutableArray: NSMutableArray = NSMutableArray(array: JSONObject as! [Any], copyItems: true)
            let indexesToRemove: NSMutableIndexSet = NSMutableIndexSet()

            for index in 0 ..< mutableArray.count {
                let indexObject: Any = mutableArray[index]

                if indexObject as? NSNull != nil {
                    indexesToRemove.add(index)
                }
                else {
                    mutableArray.replaceObject(at: index, with: removeNullFromJSONData(indexObject))
                }
            }

            mutableArray.removeObjects(at: indexesToRemove as IndexSet)

            return mutableArray;
        }
        else if JSONObject as? NSDictionary != nil {
            let mutableDictionary: NSMutableDictionary = NSMutableDictionary(dictionary: JSONObject as! [AnyHashable : Any], copyItems: true)

            for key in mutableDictionary.allKeys {
                let indexObject: Any = mutableDictionary[key] as Any

                if indexObject as? NSNull != nil {
                    mutableDictionary.removeObject(forKey: key)
                }
                else {
                    mutableDictionary.setObject(removeNullFromJSONData(indexObject), forKey: key as! NSCopying)
                }
            }

            return mutableDictionary
        }
        else {
            return JSONObject
        }
    }


    static func showAlert(title:String, message:String, buttonTitles:[String], completion: @escaping (_ responce: String) -> Void){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

        let attributes = [NSAttributedString.Key.font:UIFont(name: "Dubai-Light", size: 16.0)!]

        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttributes(attributes, range:NSMakeRange(0, attributedString.length))

        alertController.setValue(attributedString, forKey: "attributedTitle")

        // Change Message Font:
        var messageMutableString = NSMutableAttributedString()
        messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Dubai-Regular", size: 14.0)!])

        // Change Message Color:

			messageMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.systemBlack, range: NSRange(location:0,length:message.count))

        alertController.setValue(messageMutableString, forKey: "attributedMessage")


        // Actions.
        for btnTitle in buttonTitles{

            let action = UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: { action in
                completion(btnTitle)
            })
            if btnTitle == "Cancel"{
                action.setValue(Colors.systemBlack, forKey: "titleTextColor")
            }

           alertController.addAction(action)
        }

        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }

	 static func showCustomToast(titleText : String, descText : String) {

		var attributes = EKAttributes.bottomToast
		attributes.entryBackground = .visualEffect(style: .prominent)
			//gradient(gradient: .init(colors: [.red, .green], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
		attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.3), scale: .init(from: 1, to: 0.7, duration: 0.7)))
		attributes.shadow = .active(with: .init(color: .black, opacity: 0.5, radius: 10, offset: .zero))
		attributes.statusBar = .dark
		attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .jolt)
		attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .intrinsic)



		let title = EKProperty.LabelContent(text: titleText, style: .init(font: Fonts.Dubai_Bold!, color: Colors.blue))
		let description = EKProperty.LabelContent(text: descText, style: .init(font: Fonts.Dubai_Regualr!, color: Colors.blueD))

		let simpleMessage = EKSimpleMessage(title: title, description: description)
		let notificationMessage = EKNotificationMessage(simpleMessage: simpleMessage)
		let contentView = EKNotificationMessageView(with: notificationMessage)
		SwiftEntryKit.display(entry: contentView, using: attributes)

	}
    
    
}
