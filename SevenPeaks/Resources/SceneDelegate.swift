//
//  SceneDelegate.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 22/07/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appcoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window  = UIWindow(windowScene: scene)
        appcoordinator = AppCoordinator(window: window)
        appcoordinator?.start()
    }

   

}

