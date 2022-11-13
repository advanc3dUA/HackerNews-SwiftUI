//
//  DetailView.swift
//  HackerNews
//
//  Created by Yuriy Gudimov on 13.11.2022.
//

import SwiftUI

struct DetailsView: View {
    let url: String?
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://google.com")
    }
}
