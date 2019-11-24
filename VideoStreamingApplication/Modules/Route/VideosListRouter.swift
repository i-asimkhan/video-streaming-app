///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideosListRouter.swift **)
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

class VideosListRouter: VideosListPresenterToRouterProtocol {

	class func createModule() -> UIViewController {

		let view = AppStoryboard.Features.instance.instantiateViewController(withIdentifier:"VideosListViewController") as! VideosListViewController
		let presenter: VideosListViewToPresenterProtocol & VideosListInterectorToPresenterProtocol = VideosListPresenter();
		let interactor: VideosListPresentorToInterectorProtocol = VideosListInterector();
		let router: VideosListPresenterToRouterProtocol = VideosListRouter();

		view.presenter = presenter;
		presenter.view = view
		presenter.router = router;
		presenter.interector = interactor;
		interactor.presenter = presenter;

		return view;

	}

	class func createRoute(viewObj : UIViewController) {

		let presenter: VideosListViewToPresenterProtocol & VideosListInterectorToPresenterProtocol = VideosListPresenter();
		let interactor: VideosListPresentorToInterectorProtocol = VideosListInterector();
		let router: VideosListPresenterToRouterProtocol = VideosListRouter();


		// Routing
		let view = viewObj as! VideosListViewController
		view.presenter = presenter;
		presenter.view = view 
		presenter.router = router;
		presenter.interector = interactor;
		interactor.presenter = presenter;

		//return presenter

	}

}
