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
            
            if let thumbnailImage = Utility.createThumbnailImage(forUrl: url) {
                image = thumbnailImage
            }
            
            
            let remoteVideo = Video(url: url, thumbImage: image, title: "Video 1", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
            videos.append(remoteVideo)
        }
        
        
        // second video
        videoURLString = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
        if let url = URL(string: videoURLString) {
            
            var image : UIImage = UIImage()
            
            if let thumbnailImage = Utility.createThumbnailImage(forUrl: url) {
                image = thumbnailImage
            }
            
            
            let remoteVideo = Video(url: url, thumbImage: image, title: "Video 2", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
            videos.append(remoteVideo)
        }
        
        
        // third video
        videoURLString = "https://mnmedias.api.telequebec.tv/m3u8/29880.m3u8"
        if let url = URL(string: videoURLString) {
            
            
            var image : UIImage = UIImage()
            
            if let thumbnailImage = Utility.createThumbnailImage(forUrl: url) {
                image = thumbnailImage
            }
            
            let remoteVideo = Video(url: url, thumbImage: image, title: "Video 3", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
            videos.append(remoteVideo)
        }
        
        // third video
        videoURLString = "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8"
        if let url = URL(string: videoURLString) {
            var image : UIImage = UIImage()
            
            if let thumbnailImage = Utility.createThumbnailImage(forUrl: url) {
                image = thumbnailImage
            }
            
            let remoteVideo = Video(url: url, thumbImage: image, title: "Video 4", subtitle: "Will we be mauled by vicious foxes? Tune in to find out!")
            videos.append(remoteVideo)
        }
        
        
        
        
        self.presenter?.returnVideos(videos: videos)
    }
    
}

