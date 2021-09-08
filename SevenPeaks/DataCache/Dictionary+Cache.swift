//
//  Dictionary+Cache.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 25/07/21.
//

import Foundation

extension Dictionary {
    func keysSortedByValue(_ isOrderedBefore: (Value, Value) -> Bool) -> [Key] {
        return Array(self).sorted{ isOrderedBefore($0.1, $1.1) }.map{ $0.0 }
    }
}
