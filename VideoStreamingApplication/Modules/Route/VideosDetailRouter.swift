///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideoDetailRouter.swift **)
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

class VideoDetailRouter: VideoDetailPresenterToRouterProtocol {

	class func createModule() -> UIViewController {

		let view = AppStoryboard.Main.instance.instantiateViewController(withIdentifier:"VideoDetailViewController") as! VideoDetailViewController
		let presenter: VideoDetailViewToPresenterProtocol & VideoDetailInterectorToPresenterProtocol = VideoDetailPresenter();
		let interactor: VideoDetailPresentorToInterectorProtocol = VideoDetailInterector();
		let router: VideoDetailPresenterToRouterProtocol = VideoDetailRouter();

		view.presenter = presenter;
		presenter.view = view;
		presenter.router = router;
		presenter.interector = interactor;
		interactor.presenter = presenter;

		return view;


	}

	class func createRoute(viewObj : UIViewController) {

		let presenter: VideoDetailViewToPresenterProtocol & VideoDetailInterectorToPresenterProtocol = VideoDetailPresenter();
		let interactor: VideoDetailPresentorToInterectorProtocol = VideoDetailInterector();
		let router: VideoDetailPresenterToRouterProtocol = VideoDetailRouter();


		// Routing
		let view = viewObj as! VideoDetailViewController
		view.presenter = presenter;
		presenter.view = view;
		presenter.router = router;
		presenter.interector = interactor;
		interactor.presenter = presenter;


	}

}
