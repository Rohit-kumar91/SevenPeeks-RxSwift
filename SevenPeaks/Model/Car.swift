//
//  Car.swift
//  SevenPeaks
//
//  Created by Rohit Prajapati on 24/07/21.
//

import Foundation

// MARK: - Car
struct Car: Decodable {
    let status: String?
    let content: [Content]?
    let serverTime: Int?
}

// MARK: - Content
struct Content: Decodable {
    let id: Int?
    let title, dateTime: String?
    let content: [ContentContent]?
    let ingress: String?
    let image: String?
    let created, changed: Int?
}

// MARK: - ContentContent
struct ContentContent: Decodable {
    let type, subject, description: String?
}

