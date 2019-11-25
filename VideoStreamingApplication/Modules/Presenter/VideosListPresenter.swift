///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideosListPresenter.swift **)
dev_shanghai
Copyright © 2019 dev_shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation

class VideosListPresenter {

	var view: VideosListPresenterToViewProtocol?;
	var interector: VideosListPresentorToInterectorProtocol?;
	var router: VideosListPresenterToRouterProtocol?

}


extension VideosListPresenter : VideosListViewToPresenterProtocol {
    func getVideosList() {
        self.interector?.getVideos()
    }


}

extension VideosListPresenter : VideosListInterectorToPresenterProtocol {

    func returnVideos(videos : [Video]) {
        
        self.view?.videosLoadComplete(videos: videos)
        
    }
}

