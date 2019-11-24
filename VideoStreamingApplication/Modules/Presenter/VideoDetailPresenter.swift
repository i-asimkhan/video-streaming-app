///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideoDetailPresenter.swift **)
dev_shanghai
Copyright © 2019 dev_shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation

class VideoDetailPresenter {

	var view: VideoDetailPresenterToViewProtocol?;
	var interector: VideoDetailPresentorToInterectorProtocol?;
	var router: VideoDetailPresenterToRouterProtocol?

}


extension VideoDetailPresenter : VideoDetailViewToPresenterProtocol {


}

extension VideoDetailPresenter : VideoDetailInterectorToPresenterProtocol {

}
