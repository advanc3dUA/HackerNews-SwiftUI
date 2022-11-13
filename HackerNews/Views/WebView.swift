//
//  WebView.swift
//  HackerNews
//
//  Created by Yuriy Gudimov on 13.11.2022.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeUrl = urlString {
            if let url = URL(string: safeUrl) {
                let request = URLRequest(url: url)
                DispatchQueue.main.async {
                    uiView.load(request)
                }
            }
        }
    }
    
}
