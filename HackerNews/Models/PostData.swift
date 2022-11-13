//
//  PostData.swift
//  HackerNews
//
//  Created by Yuriy Gudimov on 13.11.2022.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    var id: String {
        return objectID
    }
    
    let title: String
    let url: String?
    
    let points: Int
    var pointsString: String {
        var result = String(points)
        switch result.count {
            case 1: result = "00\(result)"
            case 2: result = "0\(result)"
            default: return result
        }
        return result
    }
}
