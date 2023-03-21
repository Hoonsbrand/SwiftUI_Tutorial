//
//  MyVStack.swift
//  SwiftUI_#5_Stacks
//
//  Created by hoonsbrand on 2023/03/21.
//

import SwiftUI

struct MyVStack: View {
    
    var body: some View {
        
        // alignment: 요소들의 정렬, 가장 큰 요소를 기준으로 정렬됨
        // spacing: 요소들 간 간격 조절 가능
        VStack(alignment: .trailing, spacing: 0) {
            
//            Divider()
//                .opacity(0)
//
            Rectangle()
                .frame(height: 0)
                            
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.yellow)
            
            Spacer()
                .frame(height: 50)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
        }
        .frame(width: 300)
        .background(Color.green)
        // Spacer 사용시 safeArea를 무시하는 이슈 해결, VStack안에서 Padding을 줄 수도 있음
        .padding(.init(top: 1, leading: 1, bottom: 1, trailing: 1))
    }
}

struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}



