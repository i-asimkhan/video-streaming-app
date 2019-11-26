///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideosListViewController.swift **)
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

class VideosListViewController: BaseViewController {

	let VideoCellReuseIdentifier = "videoCell"
    var videos: [Video] = []
	
	@IBOutlet weak var videosTableView: UITableView!

	var presenter : VideosListViewToPresenterProtocol?

	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .default
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		videos = [];
		// Cell registration from the nib
			let cellNib = UINib.init(nibName: "VideoCellView", bundle: Bundle.main)
			self.videosTableView.register(cellNib, forCellReuseIdentifier: "VideoCellView")


		self.videosTableView.delegate = self;
		self.videosTableView.dataSource = self;
		self.view.backgroundColor = UIColor.black

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.view.layoutIfNeeded()
		setNavigation()

	}

	override func viewDidAppear(_ animated: Bool) {

		super.viewDidAppear(true)
		DispatchQueue.global(qos: .userInitiated).async {
			// request for videos
			self.presenter?.getVideosList()
		}


	}

	override func setNavigation() {


	}


}

extension VideosListViewController : VideosListPresenterToViewProtocol {
    func videosLoadComplete(videos: [Video]) {

			self.view.backgroundColor = UIColor.white

        // now we can show the videos
        self.videos = videos;
        self.videosTableView.reloadData()
        
    }
    

}


extension VideosListViewController : UITableViewDelegate , UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return videos.count //self.wallData?.posts?.data?.count ?? 0

	}

	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let customCell = tableView.dequeueReusableCell(withIdentifier: "VideoCellView") as! VideoCellView

		customCell.lblPostCreator.text = "Asim Khan "
		customCell.lblPostTime.text = "01:23 pm"
		customCell.lblUniversityName.text = "University of Sharjah"
		customCell.lblPostText.text = "Hi this is Asim \nI would like to sale my iPhone 7."

		customCell.btnReadmore.tag = indexPath.row
		customCell.btnReadmore.addTarget(self, action: #selector(didTapReadMoreButton(sender:)), for: UIControl.Event.touchUpInside)
		customCell.videoImage.image = videos[indexPath.row].thumbnailImage
		


		return customCell

	}

	@objc func didTapReadMoreButton(sender: UIButton) {



	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 300.0
	}





}



