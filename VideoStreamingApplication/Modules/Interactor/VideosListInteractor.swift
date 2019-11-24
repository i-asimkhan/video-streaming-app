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


class VideosListInterector {

	var presenter: VideosListInterectorToPresenterProtocol?;

}


extension VideosListInterector : VideosListPresentorToInterectorProtocol {

}

