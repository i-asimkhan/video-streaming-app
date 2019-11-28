///**
/**
 VideoStreamingApplication
 Created by: dev shanghai on 24/11/2019
 
 (** VideosListInteractor.swift **)
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


class VideosListInterector {
    
    var presenter: VideosListInterectorToPresenterProtocol?;
    
}


extension VideosListInterector : VideosListPresentorToInterectorProtocol {
    
    func getVideos() {
        
        var videos: [Video] = []
        
        // first video
        var videoURLString = "https://content.jwplatform.com/manifests/yp34SRmf.m3u8"
        if let url = URL(string: videoURLString) {
            var image : UIImage = UIImage()
            
            if let thumbnailImage = UIImage(named: "cycling") {
                image = thumbnailImage
            }
            
            
            let remoteVideo = Video(url: url, thumbImage: image, title: "Cycling", subtitle: "we will show cycling in this.", desc: "Description is here. ")
            videos.append(remoteVideo)
        }
        
        
        // second video
        videoURLString = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
        if let url = URL(string: videoURLString) {
            
            var image : UIImage = UIImage()
            
            if let thumbnailImage = UIImage(named: "snow_mountain") {
                image = thumbnailImage
            }
            
            
            let remoteVideo = Video(url: url, thumbImage: image, title: "Snow Mountain", subtitle: "we will show snow on the mountains.", desc: "Description is here. ")
            videos.append(remoteVideo)
        }
        
        
        // third video
        videoURLString = "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8"
        if let url = URL(string: videoURLString) {
            
            
            var image : UIImage = UIImage()
            
            if let thumbnailImage = UIImage(named: "group_discussion") {
                image = thumbnailImage
            }
            
            let remoteVideo = Video(url: url, thumbImage: image, title: "Group Discussion", subtitle: "how people discuss in groups.", desc: "Description is here. ")
            videos.append(remoteVideo)
        }
        
        // fourth video
        videoURLString = "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"
        if let url = URL(string: videoURLString) {
            var image : UIImage = UIImage()
            
            if let thumbnailImage = UIImage(named: "people_life") {
                image = thumbnailImage
            }
            
            let remoteVideo = Video(url: url, thumbImage: image, title: "Life of People", subtitle: "how people live" , desc: "Description is here. ")
            videos.append(remoteVideo)
        }
        
        self.presenter?.returnVideos(videos: videos)
    }
    
}

