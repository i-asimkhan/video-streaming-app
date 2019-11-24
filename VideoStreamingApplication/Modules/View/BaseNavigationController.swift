///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** BaseNavigationViewController.swift **)
dev shanghai
Copyright © 2019 dev shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

@IBDesignable
class BaseNavController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
}
