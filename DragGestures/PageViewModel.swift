//
//  PageViewModel.swift
//  DragGestures
//
//  Created by İsa Yılmaz on 24.03.2021.
//

import SwiftUI

class PageViewModel: ObservableObject {
    
    @Published var selectedTab = "tabs"
    
    @Published var urls = [
        Page(url: URL(string: "https://www.apple.com")!),
        Page(url: URL(string: "https://www.google.com")!),
        Page(url: URL(string: "https://www.twitter.com")!),
        Page(url: URL(string: "https://www.gmail.com")!),
        Page(url: URL(string: "https://www.facebook.com")!),
        Page(url: URL(string: "https://www.instagram.com")!),
        Page(url: URL(string: "https://www.apple.com")!),
        Page(url: URL(string: "https://www.google.com")!),
        Page(url: URL(string: "https://www.twitter.com")!),
        Page(url: URL(string: "https://www.gmail.com")!),

    ]
    
    @Published var currentPage : Page?
}
