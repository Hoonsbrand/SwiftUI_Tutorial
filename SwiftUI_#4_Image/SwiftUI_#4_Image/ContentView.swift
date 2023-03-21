//
//  ContentView.swift
//  SwiftUI_#4_Image
//
//  Created by hoonsbrand on 2023/03/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("backgroundImage")
                    .frame(height: 10)
                    .offset(y: -1550)
//                    .overlay(            // 뷰를 중첩시킨다.
//                        Rectangle()
//                            .fill(Color.purple)
//                    )
                
                CircleImageView()
                
                HStack {
                    NavigationLink(destination: MyWebview(urlToLoad: "https://github.com/Hoonsbrand")
                    ) {
                        Text("깃허브 보기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MyWebview(urlToLoad: "https://frequent-butterfly-0f6.notion.site/163ee2a20785474d95b73a78d1aaeeb1")
                    ) {
                        Text("포트폴리오 보기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(20)
                    }
                }
                .padding(50)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

