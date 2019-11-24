///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** Logger.swift **)
dev_shanghai
Copyright © 2019 dev_shanghai. All rights reserved.

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
            print("VideoStreamingApplication - Error -> \(value)")
        #endif
    }
    
    static func logWarning(value:Any) {
        #if DEBUG
            print("VideoStreamingApplication - Warning -> \(value)")
        #endif
    }
    
    static func logInfo(value:Any) {
        #if DEBUG
            print("VideoStreamingApplication - Info -> \(value)")
        #endif
    }
}
