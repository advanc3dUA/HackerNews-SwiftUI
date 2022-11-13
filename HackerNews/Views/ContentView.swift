//
//  ContentView.swift
//  HackerNews
//
//  Created by Yuriy Gudimov on 13.11.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts, rowContent: { post in
                NavigationLink(destination: DetailsView(url: post.url)) {
                    HStack {
                        Text(post.pointsString)
                        Text(post.title)
                    }
                }
            })
            .navigationTitle("News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
