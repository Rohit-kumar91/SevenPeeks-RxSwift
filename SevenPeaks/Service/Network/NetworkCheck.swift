//
//  NetworkCheck.swift
//  FREssentialsIOS
//
//  Created by Rohit Prajapati on 18/11/20.
//  Copyright © 2020 Front Rush. All rights reserved.
//

import Foundation
import Network

extension NSNotification.Name {
    public static let NetworkReachabilityUpdate: NSNotification.Name = NSNotification.Name(rawValue: "NetworkReachabilityUpdate")
}

class Connectivity {
    
    private var monitor = NWPathMonitor()
    static let shared = Connectivity()
    var currentStatus: NWPath.Status {
        get {
            return monitor.currentPath.status
        }
    }
    var isNetworkReachable = true
    var shouldDisplayNetworkInfo = true
    
    private init() {
        monitor.pathUpdateHandler = { [unowned self] path in
            if path.status == .satisfied {
                self.isNetworkReachable = true
            } else {
                self.isNetworkReachable = false
            }
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: Notification.Name.NetworkReachabilityUpdate, object: nil)
            }
        }
    }
    
    func startMonitoring() {
        let queue = DispatchQueue(label: "MonitorNetwork")
        monitor.start(queue: queue)
        isNetworkReachable = currentStatus == .satisfied
    }
}
