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
        
//         self.videosTableView.register(VideoTableViewCell.self, forCellReuseIdentifier: VideoCellReuseIdentifier)
        videosTableView.delegate = self
        videosTableView.dataSource = self;
        

        
        
        
        // request for videos
        self.presenter?.getVideosList()
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

extension VideosListViewController : VideosListPresenterToViewProtocol {
    func videosLoadComplete(videos: [Video]) {
        
        // now we can show the videos
        self.videos = videos;
        self.videosTableView.reloadData()
        
    }
    

}


extension VideosListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoCellReuseIdentifier, for: indexPath) as? VideoTableViewCell else {
      return VideoTableViewCell()
    }
    
//    let cell = tableView.dequeueReusableCell(withIdentifier: VideoCellReuseIdentifier, for: indexPath)
//                       as! VideoTableViewCell
    
//    let cell = tableView.dequeueReusableCell(withIdentifier: VideoCellReuseIdentifier, for: indexPath) as? VideoTableViewCell
    
    cell.previewImageView.image = videos[indexPath.row].thumbnailImage
    cell.titleLabel.text = videos[indexPath.row].title
    cell.subtitleLabel.text = videos[indexPath.row].subtitle
    return cell


  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    let video = videos[indexPath.row]
//    return VideoTableViewCell.height(for: video)
    
    return 75.0
  }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
//    let video = videos[indexPath.row]
//
//    let videoURL = video.url
//    let player = AVPlayer(url: videoURL)
//    let playerViewController = AVPlayerViewController()
//    playerViewController.player = player
//
//    present(playerViewController, animated: true) {
//      player.play()
//    }
  }
}

extension VideosListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return videos.count;
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}



