//
//  CarViewModel.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 24/07/21.
//

import Foundation
import RxCocoa
import RxSwift


struct CarViewModel {
    let content: Content
    
    var title: String {
        return content.title ?? ""
    }
    
    var description: String {
        return content.content?.first?.description ?? ""
    }
    
    var date: String {
        return content.dateTime ?? ""
    }
    
    init(_ content: Content) {
        self.content = content
    }
    
    

}
