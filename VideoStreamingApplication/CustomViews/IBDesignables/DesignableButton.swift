///**
/**
VideoStreamingApplication
Created by: dev_shanghai on 24/11/2019

(** DesignableButton.swift **)
dev_shanghai
Copyright © 2019 dev_shanghai. All rights reserved.

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
