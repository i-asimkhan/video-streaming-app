///**
/**
munawlaApp
Created by: Shoukat Ullah on 19/05/2019

(** DesignableButton.swift **)
Shoukat Ullah
Copyright © 2019 Shoukat Ullah. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

class DesignableButton: UIButton {
    @IBInspectable var corderRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = corderRadius
        }
    }
    
}
