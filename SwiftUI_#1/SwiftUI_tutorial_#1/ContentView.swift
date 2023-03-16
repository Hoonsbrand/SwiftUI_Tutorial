//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by hoonsbrand on 2023/03/09.
//

import SwiftUI

struct ContentView: View {
    
    // @State 값의 변화를 감지 -> View에 적용
    @State
    private var isActivated: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                    MyVStackView(isActivated: $isActivated)
                }   // HStack
                .padding(isActivated ? 50 : 10)
                .background(isActivated ? Color.yellow : Color.black)
                // 탭 제스쳐 추가
                .onTapGesture {
                    print("HStack이 클릭되었다.")
                    
                    // 애니메이션과 함께
                    withAnimation {
                        // toggle() true이면 false로 false이면 true
                        self.isActivated.toggle()
                    }
                }   // HStack
        
                // 네비게이션 버튼(링크)
                // destination 자체가 종착지 (view를 뜻한다)
                NavigationLink(destination: MyTextView(isActivated: $isActivated)) {
                    Text("네비게이션")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(30)
                }
                .padding(.top, 50)
            }
        }   // NavigationView
    }
}

// 보여주는 용도
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



