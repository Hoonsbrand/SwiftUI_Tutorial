//
//  MyWebview.swift
//  SwiftUI_#2_Webview
//
//  Created by hoonsbrand on 2023/03/16.
//

import SwiftUI
import WebKit

// UIKit의 UIView를 사용할 수 있도록 한다.
// 만약 UIKit의 UIViewController를 사용하고싶다면 UIViewControllerRepresentable을 사용한다.

struct MyWebview: UIViewRepresentable {
    
    var urlToLoad: String
    
    // UIView 만들기
    func makeUIView(context: Context) -> WKWebView {
        
        // unwrapping
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        
        // 웹뷰 인스턴스 생성
        let webview = WKWebView()
        
        // 웹뷰를 로드한다.
        webview.load(URLRequest(url: url))
        
        return webview
    }
    
    // 업데이트 UIView
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct MyWebview_Previews: PreviewProvider {
    static var previews: some View {
        MyWebview(urlToLoad: "https://www.naver.com")
    }
}
