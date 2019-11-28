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

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)

		self.view.layoutIfNeeded()
		setNavigation()

	}

	override func viewDidAppear(_ animated: Bool) {

		super.viewDidAppear(true)
        self.presenter?.getVideosList()

	}

	override func setNavigation() {

        addAppLogo(value: "Videos List")

	}


}

extension VideosListViewController : VideosListPresenterToViewProtocol {
    func videosLoadComplete(videos: [Video]) {

			

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


		
        customCell.titleLabel.text = videos[indexPath.row].title
        customCell.descLabel.text =  videos[indexPath.row].subtitle
        
        
        
        

        customCell.videoImage.image = videos[indexPath.row].thumbnailImage
        
        
        customCell.btnVideoDetails.tag = indexPath.row
        customCell.btnVideoDetails.addTarget(self, action:#selector(didTapReadDetailsButton), for: .touchUpInside)
		


		return customCell

	}

	@objc func didTapReadDetailsButton(sender: UIButton) {

        let videoDetailView = VideoDetailRouter.createModule() as! VideoDetailViewController
        videoDetailView.selectedVideo = self.videos[sender.tag]
        videoDetailView.allVides = self.videos
        videoDetailView.selectedIndex = sender.tag
    
        
        self.navigationController?.pushViewController(videoDetailView, animated: true)
        

	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 220.0
	}





}



