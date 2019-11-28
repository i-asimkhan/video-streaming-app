///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** HomeCC.swift **)
Al Anbar
Copyright © 2019 Al Anbar. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

class VideoCellView: UITableViewCell {


	@IBOutlet weak var btnVideoDetails: UIButton!
	@IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
