///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** StoryboardExtension.swift **)
dev shanghai
Copyright © 2019 dev shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit
import Foundation




enum AppStoryboard : String {
    
    //Add all the storyboard names you wanted to use in your project
    
    case Main
    var instance : UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        
        return instance.instantiateInitialViewController()
    }
}
