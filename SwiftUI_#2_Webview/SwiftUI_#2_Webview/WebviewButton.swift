//
//  WebviewButton.swift
//  SwiftUI_#2_Webview
//
//  Created by hoonsbrand on 2023/03/16.
//

import SwiftUI

struct WebviewButton: View {
    
    // 접속할 url
    private var url: String
    
    // 웹사이트 이름
    private var webname: String
    
    // 버튼 배경색
    private var buttonColor: Color
    
    init(url: String, webname: String, buttonColor: Color) {
        self.url = url
        self.webname = webname
        self.buttonColor = buttonColor
    }
    
    var body: some View {
        NavigationLink(destination: MyWebview(urlToLoad: url)) {
            Text(webname)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(20)
                .background(buttonColor)
                .foregroundColor(Color.white)
                .cornerRadius(20)
        }
    }
}
