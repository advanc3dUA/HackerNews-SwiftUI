//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Yuriy Gudimov on 13.11.2022.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    let urlString = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    func fetchData() {
        
        guard let url = URL(string: urlString) else { return }
            
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                let results = try decoder.decode(Results.self, from: data)
                DispatchQueue.main.async {
                    self.posts = results.hits
                }
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
