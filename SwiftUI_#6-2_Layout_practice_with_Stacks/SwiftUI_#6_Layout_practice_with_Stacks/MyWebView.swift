//
//  MyWebView.swift
//  SwiftUI_#6_Layout_practice_with_Stacks
//
//  Created by hoonsbrand on 2023/03/28.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    
    var urlToLoad: String
    
    // UIView 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        // 언래핑
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // 웹뷰 인스턴스
        let webView = WKWebView()
        
        // 웹뷰 로드
        webView.load(URLRequest(url: url))
        
        return webView
        
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://frequent-butterfly-0f6.notion.site/163ee2a20785474d95b73a78d1aaeeb1")
    }
}
