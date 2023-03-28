//
//  MyProfileView.swift
//  SwiftUI_#6_Layout_practice_with_Stacks
//
//  Created by hoonsbrand on 2023/03/28.
//

import SwiftUI

struct MyProfileView: View {
    
    private var portfolioUrl = "https://frequent-butterfly-0f6.notion.site/163ee2a20785474d95b73a78d1aaeeb1"
    
    private var gitHubUrl = "https://github.com/Hoonsbrand"
    
    var body: some View {
        
        ScrollView {
            
            VStack {
                Image("profileImage")
                    .resizable()
                    .scaledToFit()
                    .offset(y: 25)
                    .frame(width: 250, height: 300)
                    .clipShape(Circle())
                    .shadow(color: .gray, radius: 10, x: 0, y: 10)
                
                    .overlay(
                        Circle()
                            .strokeBorder(Color.yellow, lineWidth: 15)
                    )
                
                Text("꿈꾸는 이창훈")
                    .font(.system(size: 30))
                    .fontWeight(.black)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 5, trailing: 0))
                
                Text("SwiftUI는 재밌어!")
                    .font(.system(size: 20))
                    .fontWeight(.black)
                
                HStack {
                    
                    NavigationLink(destination: MyWebView(urlToLoad: portfolioUrl)
                                   
                    ) {
                        Text("포트폴리오 보기")
                            .font(.system(size: 20))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(20)
                    }
                    
                    NavigationLink(destination: MyWebView(urlToLoad: gitHubUrl)
                                   
                    ) {
                        Text("깃허브 보기")
                            .font(.system(size: 20))
                            .fontWeight(.black)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(20)
                    }
                    
                } // HStack
                .padding()
                
            } // VStack
        } // ScrollView
        .navigationTitle("내 프로필")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: Text("설정화면입니다.")
                    .font(.largeTitle)
                    .fontWeight(.black)
                ) {
                    Image(systemName: "gear")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                }
            }
        }
        
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
