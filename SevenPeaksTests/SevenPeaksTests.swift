//
//  SevenPeaksTests.swift
//  SevenPeaksTests
//
//  Created by Rohit Prajapati on 18/08/21.
//

import XCTest
import RxSwift
@testable import SevenPeaks

class SevenPeaksTests: XCTestCase {
    
    let carService = MockCarService()    
    
    func testCarAPI() {
        let exceptation = self.expectation(description: "Car API Response Parse Expectation.")
        let carServiceApi =  carService.fetchCarsFromAPI()
        let carsArray = carServiceApi.map { $0.map { CarViewModel($0) }}
        XCTAssertNotNil(carsArray)
        exceptation.fulfill()
        self.waitForExpectations(timeout: 10.0, handler: nil)
        
    }

}
