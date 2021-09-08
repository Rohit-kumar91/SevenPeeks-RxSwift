//
//  MockCarService.swift
//  SevenPeaksTests
//
//  Created by Rohit Prajapati on 25/07/21.
//

import XCTest
import RxSwift
@testable import SevenPeaks

class MockCarService: XCTestCase {
    var shouldReturnError = false
    var fetchCarsFromAPICalled = false
    var fetchCarsFormCacheCalled = false
    
    enum CarServiceError: Error {
        case fetchCarsFromAPI
        case fetchCarsFromCache
    }
    
    func reset() {
        shouldReturnError = false
        fetchCarsFromAPICalled = false
        fetchCarsFormCacheCalled = false
    }
    
    func readDataFromLocalJson() -> Car? {
        var cars: Car?
        guard let path =  Bundle.main.path(forResource: "car", ofType: "json") else {return nil}
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            cars = try JSONDecoder().decode(Car.self, from: data)
        } catch {
            print("Error in reading the data")
        }
        
        return cars
    }

}

extension MockCarService: CarServiceProtocol {
    
    func fetchCarsFromAPI() -> Observable<[Content]> {
        fetchCarsFromAPICalled = true
        if shouldReturnError {
            return Observable.create { observer -> Disposable in
                observer.onError(CarServiceError.fetchCarsFromAPI)
                return Disposables.create {}
            }            
        } else {
            return Observable.create { observer -> Disposable in
                observer.onError(CarServiceError.fetchCarsFromAPI)
                observer.onNext(self.readDataFromLocalJson()?.content ?? [])
                return Disposables.create {}
            }  
        }
    }
    
    func fetchCarsFromCache() -> Observable<[Content]> {
        fetchCarsFormCacheCalled = true
        if shouldReturnError {
            return Observable.create { observer -> Disposable in
                observer.onError(CarServiceError.fetchCarsFromCache)
                return Disposables.create {}
            }
        } else {
            return Observable.create { observer -> Disposable in
                observer.onError(CarServiceError.fetchCarsFromAPI)
                observer.onNext(self.readDataFromLocalJson()?.content ?? [])
                return Disposables.create {}
            }
        }
    }
}
