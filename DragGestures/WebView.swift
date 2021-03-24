//
//  WebView.swift
//  DragGestures
//
//  Created by İsa Yılmaz on 24.03.2021.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: url))
        view.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        view.isUserInteractionEnabled = false
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}
