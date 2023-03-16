//
//  ContentView.swift
//  SwiftUI_#2_Webview
//
//  Created by hoonsbrand on 2023/03/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            
            HStack {
                WebviewButton(url: "https://www.naver.com", webname: "네이버", buttonColor: Color.green)
                WebviewButton(url: "https://www.daum.net",webname: "다음", buttonColor: Color.orange)
                WebviewButton(url: "https://www.google.com", webname: "구글", buttonColor: Color.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
