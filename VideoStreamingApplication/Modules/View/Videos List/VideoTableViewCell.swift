//
//  VideoTableViewCell.swift
//  VideoStreamingApplication
//
//  Created by Asim Khan on 25/11/2019.
//  Copyright © 2019 dev_shanghai. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
