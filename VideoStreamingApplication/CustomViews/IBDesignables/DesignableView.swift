///**
/**
munawlaApp
Created by: Shoukat Ullah on 19/05/2019

(** DesignableView.swift **)
Shoukat Ullah
Copyright © 2019 Shoukat Ullah. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

@IBDesignable class DesignableView: UIView {
    
    @IBInspectable var corderRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = corderRadius
        }
    }
}
