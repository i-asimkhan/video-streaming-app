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

	let VideoCellReuseIdentifier = "VideoCell"
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

}


extension VideosListViewController: UITableViewDelegate {
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
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    addSubviews()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    backgroundColor = .blue
  }
}


extension VideoTableViewCell {
  func addSubviews() {
    previewImageView.contentMode = .scaleAspectFill
    previewImageView.clipsToBounds = true
    previewImageView.layer.cornerRadius = 4.0

    addSubview(titleLabel)
    addSubview(previewImageView)
    addSubview(subtitleLabel)
  }

  func updateViews() {
    titleLabel.text = video?.title
    titleLabel.font = UIFont.systemFont(ofSize: 24.0)

    let image = UIImage(named: (video?.thumbURL.path)!)
    previewImageView.image = image

    subtitleLabel.text = video?.subtitle
    subtitleLabel.font = UIFont.systemFont(ofSize: 14.0)
    subtitleLabel.numberOfLines = 0
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    let previewHeight: CGFloat = 200
    let padding: CGFloat = 16

    let widthWithPadding = bounds.width - (2*padding)

    // Size
    let titleSize = titleLabel.sizeThatFits(CGSize(width: widthWithPadding, height: .infinity))
    titleLabel.bounds = CGRect(x: 0, y: 0, width: titleSize.width, height: titleSize.height)

    let subtitleSize = subtitleLabel.sizeThatFits(CGSize(width: widthWithPadding, height: .infinity))
    subtitleLabel.bounds = CGRect(x: 0, y: 0, width: subtitleSize.width, height: subtitleSize.height)

    previewImageView.bounds = CGRect(x: 0, y: 0, width: widthWithPadding, height: previewHeight)

    // Center
    titleLabel.center = CGPoint(x: titleLabel.bounds.width/2.0 + padding, y: padding + titleLabel.bounds.height/2.0)

    let imageYCenter = titleLabel.frame.origin.y + titleSize.height + padding + previewHeight/2.0
    previewImageView.center = CGPoint(x: bounds.width/2.0, y: imageYCenter)

    let subtitleYCenter = previewImageView.frame.origin.y + previewImageView.bounds.height + padding
    subtitleLabel.center = CGPoint(x: subtitleLabel.bounds.width/2.0 + padding, y: subtitleYCenter)
  }
}

//extension VideoLooperView {
//  override func layoutSubviews() {
//    super.layoutSubviews()
//
//    videoPlayerView.frame = bounds
//    addSubview(videoPlayerView)
//  }
//}



