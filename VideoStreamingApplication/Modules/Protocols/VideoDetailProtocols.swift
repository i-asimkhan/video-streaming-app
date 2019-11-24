///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideoDetailProtocols.swift **)
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
protocol VideoDetailPresenterToRouterProtocol: class {
	static func createModule() -> UIViewController;
}

// Declared in View
// Defined in Presenter
// View - Presenter (The process of presentation)
protocol VideoDetailViewToPresenterProtocol: class {
	var view: VideoDetailPresenterToViewProtocol? {get set};
	var interector: VideoDetailPresentorToInterectorProtocol? {get set};
	var router: VideoDetailPresenterToRouterProtocol? {get set}

}


// Declared in Presentor
// Defined in Interector
// View requests Presenter to respond on user interactions
// Presenter asks Interector for all the bussiness logic for results
protocol VideoDetailPresentorToInterectorProtocol: class {
	var presenter: VideoDetailInterectorToPresenterProtocol? {get set};
}


// Declared in Interector
// Defined in Presenter
// Presenter is informed about completion of calculations and business logics results are ready.
protocol VideoDetailInterectorToPresenterProtocol: class {
}


// Declared in Presentor
// Defined in View
// Now in View we can show the responses of Interector sent by Presenter
protocol VideoDetailPresenterToViewProtocol: class {
}




