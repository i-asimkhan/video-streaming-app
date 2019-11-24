///**
/**
VideoStreamingApplication
Created by: dev shanghai on 24/11/2019

(** BaseViewController.swift **)
dev shanghai
Copyright © 2019 dev shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //* Update status bar style *//
        self.setNeedsStatusBarAppearanceUpdate()
    }

		override func viewDidDisappear(_ animated: Bool) {
			self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
		}

	

		func pushViewController(_ viewController: UIViewController, animated: Bool) {


			self.dismiss(animated: true, completion: nil)
			self.pushViewController(viewController, animated: true)
			self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false

		}

    func setNavigation(){

			self.tabBarController?.tabBar.isHidden = false
			self.navigationController?.navigationBar.isHidden = false
			self.navigationController?.navigationBar.barTintColor = Colors.HomeViewBgColor
			self.navigationController?.navigationBar.tintColor = Colors.systemWhite

			//addAppLogo()
    }

		func resetNavigation() {

			self.tabBarController?.tabBar.isHidden = false
			self.navigationController?.navigationBar.isHidden = false
			self.navigationController?.navigationBar.barTintColor = Colors.HomeViewBgColor
			self.navigationController?.navigationBar.tintColor = Colors.systemWhite

		}

	func setNavigation(barTintColor : UIColor = Colors.NavbarBgColor ?? UIColor.gray, tintColor : UIColor = Colors.systemWhite){

			self.tabBarController?.tabBar.isHidden = false
			self.navigationController?.navigationBar.isHidden = false
			self.navigationController?.navigationBar.barTintColor = barTintColor
			self.navigationController?.navigationBar.tintColor = Colors.systemWhite

			//addAppLogo()
		}

		func makeFullScreen() {

			self.tabBarController?.tabBar.isHidden = true
			self.navigationController?.navigationBar.isHidden = true
		}
    
    func addAppLogo(){
        let navView = UIView()
        
        let image = UIImageView()
        image.image = UIImage(named: "munawlaLogo")
        
        image.frame = CGRect(x: 0, y: 0, width: 75, height: 30)
        image.center = navView.center
        image.contentMode = UIView.ContentMode.scaleAspectFit
        navView.addSubview(image)
        
        navigationItem.titleView = navView
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.isTranslucent = false
        
        navView.sizeToFit()
    }

		func addBackButton(color: UIColor = .black) {
			let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
			leftView.backgroundColor = Colors.systemClear

			let backButtonImg = UIImageView(frame: CGRect(x: 0, y: 10, width: 20, height: 20))
			backButtonImg.image = #imageLiteral(resourceName: "moveBackward")
			backButtonImg.image = backButtonImg.image?.withRenderingMode(.alwaysTemplate)
			backButtonImg.tintColor = color

			let backButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
			backButton.addTarget(self, action: #selector(back), for: UIControl.Event.touchUpInside)

			leftView.addSubview(backButtonImg)
			leftView.addSubview(backButton)

			self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftView)
		}
    



    
    @objc func back() {
        _ = self.navigationController?.popViewController(animated: true)
    }
}



