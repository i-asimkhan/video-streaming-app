///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideosListProtocols.swift **)
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

// Declared in Presenter
// Defined in Router
// Routing - Transitions (The process of routing)
protocol VideosListPresenterToRouterProtocol: class {
	static func createModule() -> UIViewController;
}

// Declared in View
// Defined in Presenter
// View - Presenter (The process of presentation)
protocol VideosListViewToPresenterProtocol: class {
	var view: VideosListPresenterToViewProtocol? {get set};
	var interector: VideosListPresentorToInterectorProtocol? {get set};
	var router: VideosListPresenterToRouterProtocol? {get set}
    
    func getVideosList();

}


// Declared in Presentor
// Defined in Interector
// View requests Presenter to respond on user interactions
// Presenter asks Interector for all the bussiness logic for results
protocol VideosListPresentorToInterectorProtocol: class {
	var presenter: VideosListInterectorToPresenterProtocol? {get set};
    
    func getVideos()
}


// Declared in Interector
// Defined in Presenter
// Presenter is informed about completion of calculations and business logics results are ready.
protocol VideosListInterectorToPresenterProtocol: class {
    
    func returnVideos(videos : [Video])
    
}


// Declared in Presentor
// Defined in View
// Now in View we can show the responses of Interector sent by Presenter
protocol VideosListPresenterToViewProtocol: class {
    
    func videosLoadComplete(videos : [Video])
    
}
