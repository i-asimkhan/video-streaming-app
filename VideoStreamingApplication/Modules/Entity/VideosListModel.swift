///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideosListModel.swift **)
dev_shanghai
Copyright © 2019 dev_shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation

import UIKit


class Video: NSObject {
let url: URL
let thumbnailImage: UIImage
let title: String
let subtitle: String

init(url: URL, thumbImage: UIImage, title: String, subtitle: String) {
	self.url = url
	self.thumbnailImage = thumbImage
	self.title = title
	self.subtitle = subtitle
	super.init()
    }
}
