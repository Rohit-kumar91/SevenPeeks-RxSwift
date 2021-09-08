//
//  SevenPeaksConfig.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 25/07/21.
//

import Foundation

struct SevenPeaksConfig {
    
    //MARK: - Property
    static var config: String?
    static var variables: NSDictionary?
    
    //MARK: - Functions
    static func setConfiguaration() {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            let configValue = configuration.replacingOccurrences(of: " ", with: "", options: .literal, range: nil)
            self.config = configValue.replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
            if let path = Bundle.main.path(forResource: "Configuration", ofType: "plist") {
                let dict = NSDictionary(contentsOfFile: path)
                self.variables = dict!.object(forKey: self.config!) as? NSDictionary
            }
        }
    }
    
    static func apisBaseURL() -> String {
        self.setConfiguaration()
        if (self.variables) != nil {
            if let url = self.variables!.object(forKey: "APIBaseUrl") as? String {
                return url
            }
        }
        return ""
    }
}
