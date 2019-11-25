///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideoDetailViewController.swift **)
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

class VideoDetailViewController: BaseViewController {

	var presenter : VideoDetailViewToPresenterProtocol?

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .default
	}

	override func viewDidLoad() {

		super.viewDidLoad()
		VideoDetailRouter.createRoute(viewObj: self)

	}


	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.view.layoutIfNeeded()

		setNavigation()

	}

	override func viewDidAppear(_ animated: Bool) {

		super.viewDidAppear(true)


	}

	override func setNavigation() {


	}

}

extension VideoDetailViewController : VideoDetailPresenterToViewProtocol {

}
