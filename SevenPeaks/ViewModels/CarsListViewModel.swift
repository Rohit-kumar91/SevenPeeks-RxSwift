//
//  CarsListViewModel.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 25/07/21.
//

import Foundation
import RxSwift

final class CarListViewModel {
    private let carService: CarServiceProtocol
    
    init(carService: CarServiceProtocol = CarService()) {
        self.carService = carService
    }
    
    func fetchCarViewModel() -> Observable<[CarViewModel]> {
        let carServiceApi =  Connectivity.shared.isNetworkReachable ? carService.fetchCarsFromAPI() : carService.fetchCarsFromCache()
        return carServiceApi.map { $0.map { CarViewModel($0) }}
    }
}
