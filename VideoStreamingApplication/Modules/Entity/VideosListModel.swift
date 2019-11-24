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
let thumbURL: URL
let title: String
let subtitle: String

init(url: URL, thumbURL: URL, title: String, subtitle: String) {
	self.url = url
	self.thumbURL = thumbURL
	self.title = title
	self.subtitle = subtitle
	super.init()
}

class func allVideos() -> [Video] {
	var videos: [Video] = []

	// first video
	var videoURLString = "https://content.jwplatform.com/manifests/yp34SRmf.m3u8"
	if let url = URL(string: videoURLString) {
		let thumbURLPath = Bundle.main.path(forResource: "foxVillage", ofType: "png")!
		let thumbURL = URL(fileURLWithPath: thumbURLPath)
		let remoteVideo = Video(url: url, thumbURL: thumbURL, title: "Video 1", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
		videos.append(remoteVideo)
	}


	// second video
	 videoURLString = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
	if let url = URL(string: videoURLString) {
		let thumbURLPath = Bundle.main.path(forResource: "video2", ofType: "png")!
		let thumbURL = URL(fileURLWithPath: thumbURLPath)
		let remoteVideo = Video(url: url, thumbURL: thumbURL, title: "Video 2", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
		videos.append(remoteVideo)
	}


	// third video
	 videoURLString = "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8"
	if let url = URL(string: videoURLString) {
		let thumbURLPath = Bundle.main.path(forResource: "video3", ofType: "png")!
		let thumbURL = URL(fileURLWithPath: thumbURLPath)
		let remoteVideo = Video(url: url, thumbURL: thumbURL, title: "Video 3", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
		videos.append(remoteVideo)
	}

	// third video
	 videoURLString = "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"
	if let url = URL(string: videoURLString) {
		let thumbURLPath = Bundle.main.path(forResource: "video4", ofType: "png")!
		let thumbURL = URL(fileURLWithPath: thumbURLPath)
		let remoteVideo = Video(url: url, thumbURL: thumbURL, title: "Video 4", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
		videos.append(remoteVideo)
	}




    return videos
  }
}
