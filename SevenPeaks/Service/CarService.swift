//
//  CarService.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 25/07/21.
//

import Foundation
import RxSwift

protocol CarServiceProtocol {
    func fetchCarsFromAPI() -> Observable<[Content]>
    func fetchCarsFromCache() -> Observable<[Content]>
}

class CarService: CarServiceProtocol {
    func fetchCarsFromAPI() -> Observable<[Content]> {
        return Observable.create { observer -> Disposable in
            let task = URLSession.shared.dataTask(with: URL(string: "\(SevenPeaksConfig.apisBaseURL())\(Endpoint.getArticlesList)")!) { data, _, _ in
                guard let data = data  else {
                    observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                    return
                }
                
                do {
                    let carsResult = try JSONDecoder().decode(Car.self, from: data)
                    guard let content = carsResult.content else { return }
                    DataCache.instance.write(data: data, forKey: Endpoint.getArticlesList)
                    observer.onNext(content)
                } catch {
                    observer.onError(error)
                }
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    
    func fetchCarsFromCache() -> Observable<[Content]> {
        return Observable.create { observer -> Disposable in
            if let data = DataCache.instance.readData(forKey: Endpoint.getArticlesList) {
                do {
                    let carsResult = try JSONDecoder().decode(Car.self, from: data)
                    if let content = carsResult.content {
                        DataCache.instance.write(data: data, forKey: Endpoint.getArticlesList)
                        observer.onNext(content)
                    }
                } catch {
                    observer.onError(error)
                }
            }
            return Disposables.create {}
        }
    }
}
