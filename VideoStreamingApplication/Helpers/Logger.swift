///**
/**
munawlaApp
Created by: dev shanghai on 18/05/2019

(** Logger.swift **)
Shoukat Ullah
Copyright © 2019 Shoukat Ullah. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

class Logger {
    static func logException(error:Error) {
        #if DEBUG
            print("ShowUoff - Exception -> \(error.localizedDescription)")
        #endif
        
			/*
			Crashlytics.sharedInstance().recordError(error)
			*/
    }
    
    static func logError(value:Any) {
        #if DEBUG
            print("munawlaApp - Error -> \(value)")
        #endif
    }
    
    static func logWarning(value:Any) {
        #if DEBUG
            print("munawlaApp - Warning -> \(value)")
        #endif
    }
    
    static func logInfo(value:Any) {
        #if DEBUG
            print("munawlaApp - Info -> \(value)")
        #endif
    }
}
