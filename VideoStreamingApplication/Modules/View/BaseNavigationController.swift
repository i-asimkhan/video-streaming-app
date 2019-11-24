///**
/**
munawlaApp
Created by: dev shanghai on 17/05/2019

(** BaseNavView.swift **)
Shoukat Ullah
Copyright © 2019 Shoukat Ullah. All rights reserved.

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
