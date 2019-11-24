///**
/**
munawlaApp
Created by: dev shanghai on 18/05/2019

(** NetworkManager.swift **)
Shoukat Ullah
Copyright © 2019 Shoukat Ullah. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation
import Reachability

protocol NetworkManagerDelegate {
    func isConnected()
    func isNotConnected()
}
class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    private init() {}
    
    var reachability : Reachability!
    var delegate : NetworkManagerDelegate! 
    func observeReachability(){
        UserDefaults.standard.set(true, forKey: "isFirstConnection")
        self.reachability = Reachability()
        NotificationCenter.default.addObserver(self, selector:#selector(self.reachabilityChanged), name: NSNotification.Name(rawValue: "reachabilityChanged"), object: nil)
        do {
            try self.reachability.startNotifier()
        }
        catch(let error) {
            Logger.logInfo(value: "Error occured while starting reachability notifications : \(error.localizedDescription)")
        }
    }
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        let firstConnectionCheck: Bool = UserDefaults.standard.value(forKey: "isFirstConnection") as! Bool
        switch reachability.connection {
        case .cellular:
            if !(firstConnectionCheck){
            }
            Logger.logInfo(value: "Network available via Cellular Data.")
            if delegate != nil{
                delegate.isConnected()
            }
            break
        case .wifi:
            Logger.logInfo(value: "Network available via WiFi.")
            if delegate != nil{
                delegate.isConnected()
            }
            if !(firstConnectionCheck){
            }
            break
        case .none:
            Logger.logInfo(value: "Network is not available.")
            if delegate != nil{
                delegate.isNotConnected()
            }
            if !(firstConnectionCheck){
            }
            break
        }
        UserDefaults.standard.set(false, forKey: "isFirstConnection")
    }
    
    func isConnected()-> Bool{

			if let reach = reachability , reach.connection != .none {

				return true

			} else {

				// Network Reachibility
				self.observeReachability()
				return false

			}
    }
}

