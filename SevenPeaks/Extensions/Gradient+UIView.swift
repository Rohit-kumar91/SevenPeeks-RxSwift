//
//  ImageLoader.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 25/07/21.
//

import UIKit

extension UIView {
    
   // For insert layer in Foreground
   func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]) {
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.addSublayer(gradient)
   }
    
   // For insert layer in background
   func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]) {
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.insertSublayer(gradient, at: 0)
   }
}
