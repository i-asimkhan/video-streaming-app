///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** VideosListView.swift **)
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

class VideosListView: BaseViewController {

	
	@IBOutlet weak var videosTableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
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


extension VideosListView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoCellReuseIdentifier, for: indexPath) as? VideoTableViewCell else {
      return VideoTableViewCell()
    }
    cell.video = videos[indexPath.row]
    return cell
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let video = videos[indexPath.row]
    return VideoTableViewCell.height(for: video)
  }

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //2 Create an AVPlayerViewController and present it when the user taps
    let video = videos[indexPath.row]

    let videoURL = video.url
    let player = AVPlayer(url: videoURL)
    let playerViewController = AVPlayerViewController()
    playerViewController.player = player

    present(playerViewController, animated: true) {
      player.play()
    }
  }
}

extension VideosListView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
}



class VideoTableViewCell: UITableViewCell {
  let titleLabel = UILabel()
  let previewImageView = UIImageView()
  let subtitleLabel = UILabel()

  var video: Video? = nil {
    didSet {
      updateViews()
    }
  }

  // Sizing
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(false, animated: false)
  }

  // MARK - Table Cell Height

  class func height(for viewModel: Video) -> CGFloat {
    let previewHeight: CGFloat = 200
    let padding: CGFloat = 16

    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 24.0)
    label.text = viewModel.title
    let titleHeight = label.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 32, height: .infinity)).height

    label.text = viewModel.subtitle
    label.font = UIFont.systemFont(ofSize: 14.0)
    let subtitleHeight = label.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 32, height: .infinity)).height

    return padding + titleHeight + padding + previewHeight + padding + subtitleHeight + padding
  }

  // MARK - Obligatory Inits
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    addSubviews()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    backgroundColor = .blue
  }
}

