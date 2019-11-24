///**
/**
VideoStreamingApplication
Created by: dev_shanghai on 24/11/2019

(** DesignableView.swift **)
dev_shanghai
Copyright © 2019 dev_shanghai. All rights reserved.

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
