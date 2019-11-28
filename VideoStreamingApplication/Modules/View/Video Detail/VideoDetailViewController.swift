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
import AVFoundation

class VideoDetailViewController: BaseViewController {
    
    // video details view
    
    @IBOutlet weak var videoViewContainer: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoThumbnailImage: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var videoPlayerView: UIView!
    
   
    
    
    // video controls container
    
    @IBOutlet weak var videoControlsView: UIView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var horizontalVideoSlider: UISlider!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var videoPlayButtonView: UIView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resizeScreenButton: UIButton!
    
    // constraints
    @IBOutlet weak var videwPlayerContainerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var playerControlsContainerHeightConstraint: NSLayoutConstraint!
    
    
    // videos thumbnail related variables
    var videosThumbnailOverlay : UIStackView = UIStackView()
    
    // varibales
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var playerTimeObserver : Any!
    var isVideoPlaying = false
    var isFullScreen = false
    var timer : Timer?
    
    var allVides : [Video]?
    var selectedIndex : Int?
    var selectedVideo : Video?
    var presenter : VideoDetailViewToPresenterProtocol?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
		return .default
	}

	override func viewDidLoad() {

		super.viewDidLoad()
		
        
        self.videoThumbnailImage.image = self.selectedVideo?.thumbnailImage
        self.videoTitleLabel.text = self.selectedVideo?.title
        self.videoDescription.text = self.selectedVideo?.videoDescription
        self.videwPlayerContainerHeightConstraint.constant = self.view.bounds.size.height * 0.4
        
        // initilize video player
        intializeVideoPlayer()

	}
    


	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.view.layoutIfNeeded()
		setNavigation()

	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(true)
	}
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        stopPlayer()
    }

	override func setNavigation() {
        addBackButton()
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        playerLayer.frame = videoView.bounds
        videosThumbnailOverlay.frame = CGRect(x: 0, y: videoView.bounds.height - 50, width: videoView.bounds.width - 10, height: 50)
          if isFullScreen {
              playerLayer.videoGravity = .resizeAspectFill
          } else {
              playerLayer.videoGravity = .resize
          }
        
    }
    
    
    // play video
    @IBAction func didTapPlayVideo(_ sender: Any) {
        
        self.startVideo()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        player.seek(to: CMTimeMake(value: Int64(sender.value*1000), timescale: 1000))
        
    }
    
    
    @IBAction func didTapLastVideo(_ sender: Any) {
        
        if (selectedIndex! > 0) {
            selectedIndex! -= 1
            selectedVideo! = allVides![selectedIndex!]
        }
        
        
        restartPlayer()
    }
    
    @IBAction func didTapPlayPause(_ sender: UIButton) {
        
        if isVideoPlaying {
            player.pause()
            let play = UIImage(systemName: "play.fill")


            sender.setImage(play, for: .normal)
        }else {
            player.play()
            let pause = UIImage(systemName: "pause.fill")
            sender.setImage(pause, for: .normal)
        }
        
      

        isVideoPlaying = !isVideoPlaying
    }
    
    
    @IBAction func didTapResizeScreen(_ sender: Any) {
        
        if (!isFullScreen) {
            
            isFullScreen = true
            let newHeight = self.view.bounds.size.height
            UIView.animate(withDuration: 0.5) {
                
                self.videwPlayerContainerHeightConstraint.constant = newHeight
                self.view.layoutIfNeeded()
                
            }
            
        } else {
            isFullScreen = false
            let newHeight = self.view.bounds.size.height * 0.4
            UIView.animate(withDuration: 0.5) {
                
                self.videwPlayerContainerHeightConstraint.constant = newHeight
                self.view.layoutIfNeeded()
                
            }
        }
        
    }
    
    @IBAction func didTapShowHideThumbnails(_ sender: Any) {
        
        self.videosThumbnailOverlay.isHidden = !self.videosThumbnailOverlay.isHidden
        
    }
    
    @IBAction func didTapNextVideo(_ sender: Any) {
        
        if (selectedIndex! < allVides!.count - 1) {
           selectedIndex! += 1
           selectedVideo! = allVides![selectedIndex!]
        }


        restartPlayer()
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        updatePlayerEndTime( key : keyPath ?? "")
       
    }
}

extension VideoDetailViewController {
    
    @objc func showHideControlContainer()
    {
        if (self.videoControlsView.isHidden) {
            self.videoControlsView.isHidden = false
            UIView.animate(withDuration: 0.5) {
                
                self.playerControlsContainerHeightConstraint.constant = 75.0
                self.view.layoutIfNeeded()
                self.viewDidLayoutSubviews()
                
            }
        } else {
            
            UIView.animate(withDuration: 0.5,  animations: {
                self.playerControlsContainerHeightConstraint.constant = 0.0
                self.view.layoutIfNeeded()
                self.viewDidLayoutSubviews()
            }, completion: {
                (value: Bool) in
                self.videoControlsView.isHidden = true
            })
           
        }
    }
   
     func intializeVideoPlayer() {
        let url = self.selectedVideo?.url
        player = AVPlayer(url: url!)
        player.currentItem?.addObserver(self, forKeyPath: "duration", options: [.new, .initial], context: nil)
        addTimeObserver()
        playerLayer = AVPlayerLayer(player: player)
          if isFullScreen {
              playerLayer.videoGravity = .resizeAspectFill
          } else {
              playerLayer.videoGravity = .resize
          }
        
        videoView.layer.addSublayer(playerLayer)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(videoTap))
        tap.delegate = self
        if #available(iOS 11.0, *) {
            videoView.addGestureRecognizer(tap)
        } else {
            videoView.addGestureRecognizer(tap)
            videoView?.subviews.first?.addGestureRecognizer(tap)
        }
        
        NotificationCenter.default.addObserver(
               self,
               selector: #selector(videoCompleted),
               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
               object: nil)
        
        videosThumbnailOverlay = getOverlayThumbnail(parentFrame: CGRect(x: 0, y: videoView.bounds.height - 50, width: videoView.bounds.width - 10, height: 50))
        playerLayer.addSublayer(videosThumbnailOverlay.layer)
        self.videoView.addSubview(videosThumbnailOverlay)
        self.videosThumbnailOverlay.isHidden = true
        
    }
    
    func startVideo() {
        let pause = UIImage(systemName: "pause.fill")
        playPauseButton.setImage(pause, for: .normal)
        isVideoPlaying = true
        player.play()
        
        self.videoPlayButtonView.isHidden = true
        self.videoThumbnailImage.isHidden  = true
        
        self.videoControlsView.isHidden = false
        UIView.animate(withDuration: 0.5) {
            
            self.playerControlsContainerHeightConstraint.constant = 75.0
            self.view.layoutIfNeeded()
            self.viewDidLayoutSubviews()
            
        }
        
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(showHideControlContainer), userInfo: nil, repeats: true)
    }
    
    func restartPlayer() {
        if let observer = self.playerTimeObserver {
            
            selectedVideo = allVides![selectedIndex!]
            self.player.removeTimeObserver(observer)
            player.pause()
            player = nil
            
            timer?.invalidate()
            timer = nil
            
            self.intializeVideoPlayer()
            startVideo()
            
        }
        
        
       
    }
    
    
    @objc func videoCompleted() {
        self.timer?.invalidate()
        self.timer = nil

        self.player.seek(to: CMTime.zero)
        self.player.pause()
        self.horizontalVideoSlider.value = 0
        self.isVideoPlaying = false

        let play = UIImage(systemName: "play.fill")
        self.playPauseButton.setImage(play, for: .normal)
    }
    
    @objc func videoTap(_ button: UIButton) {
        print("Tapped on video")
        
        if (isVideoPlaying) {
           timer?.invalidate()
           timer = nil
           timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(showHideControlContainer), userInfo: nil, repeats: true)
           showHideControlContainer()
        }
    }
    
    func addTimeObserver() {
       let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
       let mainQueue = DispatchQueue.main
       playerTimeObserver = player.addPeriodicTimeObserver(forInterval: interval, queue: mainQueue, using: { [weak self] time in
            
            if (self?.player! != nil) {
                guard let currentItem = self?.player.currentItem else {return}
                self?.horizontalVideoSlider.maximumValue = Float(currentItem.duration.seconds)
                self?.horizontalVideoSlider.minimumValue = 0
                self?.horizontalVideoSlider.value = Float(currentItem.currentTime().seconds)
                self?.startLabel.text = self?.getTimeString(from: currentItem.currentTime())
                
                if (currentItem.duration == currentItem.currentTime()) {
                   
                    
                }
               
            }
            
            
           
        })
   }
    
    func getTimeString(from time: CMTime) -> String {
        let totalSeconds = CMTimeGetSeconds(time)
        let hours = Int(totalSeconds/3600)
        let minutes = Int(totalSeconds/60) % 60
        let seconds = Int(totalSeconds.truncatingRemainder(dividingBy: 60))
        if hours > 0 {
            return String(format: "%i:%02i:%02i", arguments: [hours,minutes,seconds])
        }else {
            return String(format: "%02i:%02i", arguments: [minutes,seconds])
        }
    }
    
    func updatePlayerEndTime(key : String) {
        if (player != nil) {
            
            if key == "duration", let duration = player.currentItem?.duration.seconds, duration > 0.0 {
                self.endLabel.text = getTimeString(from: player.currentItem!.duration)
            }
        }
        
    }
    
    func stopPlayer() {
        if let play = player , let observer = self.playerTimeObserver {
            
            play.removeTimeObserver(observer)
            player.pause()
            print("stopped")
            
            //play.pause()
            // player = nil
            // print("player deallocated")
        } else {
            print("player was already deallocated")
        }
    }

}

extension VideoDetailViewController : VideoDetailPresenterToViewProtocol {

}



extension VideoDetailViewController {
    
    func getOverlayThumbnail(parentFrame : CGRect) -> UIStackView {
        
        let stackView = UIStackView()
        stackView.frame = parentFrame
                
                
        stackView.axis  = NSLayoutConstraint.Axis.horizontal
        stackView.distribution  = UIStackView.Distribution.fillEqually
        stackView.alignment = UIStackView.Alignment.fill
        stackView.spacing = 10.0
              
                
        
        let imageBtn0 = UIButton(type: .custom)
        imageBtn0.setImage(allVides?[0].thumbnailImage, for: .normal)
        imageBtn0.tag = 0
        imageBtn0.addTarget(self, action:#selector(didThumbnailButton), for: .touchUpInside)
        imageBtn0.isUserInteractionEnabled = true
    
        
        
        let imageBtn1 = UIButton(type: .custom)
        imageBtn1.setImage(allVides?[1].thumbnailImage, for: .normal)
        imageBtn1.tag = 1
        imageBtn1.addTarget(self, action:#selector(didThumbnailButton), for: .touchUpInside)
        imageBtn1.isUserInteractionEnabled = true
        
            
    
        let imageBtn2 = UIButton(type: .custom)
        imageBtn2.setImage(allVides?[2].thumbnailImage, for: .normal)
        imageBtn2.tag = 2
        imageBtn2.addTarget(self, action:#selector(didThumbnailButton), for: .touchUpInside)
        imageBtn2.isUserInteractionEnabled = true
        

        let imageBtn3 = UIButton(type: .custom)
        imageBtn3.setImage(allVides?[3].thumbnailImage, for: .normal)
        imageBtn3.tag = 3
        imageBtn3.addTarget(self, action:#selector(didThumbnailButton), for: .touchUpInside)
        imageBtn3.isUserInteractionEnabled = true
        
        
                
        stackView.addArrangedSubview(imageBtn0)
        stackView.addArrangedSubview(imageBtn1)
        stackView.addArrangedSubview(imageBtn2)
        stackView.addArrangedSubview(imageBtn3)
        
                
        return stackView
    }
    
    @objc func didThumbnailButton(sender: UIButton)  {
        switch sender.tag {
         case 0 :
             print("select first view")

             selectedIndex! = 0
             restartPlayer()
             break
         case 1 :
             print("select second view")
             
             selectedIndex! = 1
             restartPlayer()
             break
         case 2 :
             print("select third view")
             
             selectedIndex! = 2
             restartPlayer()
             break
         case 3 :
             print("select fourth view")
             
             selectedIndex! = 3
             restartPlayer()
             break
         default:
             print("default")
         }
         
    }
    
}


extension VideoDetailViewController {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }

    func handleTapOffModal(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
