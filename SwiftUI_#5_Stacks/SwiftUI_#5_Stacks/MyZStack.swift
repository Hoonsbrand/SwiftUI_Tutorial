//
//  MyZStack.swift
//  SwiftUI_#5_Stacks
//
//  Created by hoonsbrand on 2023/03/21.
//

import SwiftUI

struct MyZStack: View {
    var body: some View {
        
        ZStack {
            
// MARK: - 순서에 따라 선언
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
            
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(.yellow)
            
// MARK: - 순서에 따라 선언하지 않았을 때 -> zIndex 이용
//            Rectangle()
//                .frame(width: 50, height: 50)
//                .foregroundColor(.yellow)
//                .zIndex(2)
//
//            Rectangle()
//                .frame(width: 100, height: 100)
//                .foregroundColor(.red)
//                .zIndex(1)
//
//            Rectangle() // zIndex 기본값 0, 높을수록 위의 층에 존재
//                .frame(width: 150, height: 150)
//                .foregroundColor(.blue)
            
        }
    }
}

struct MyZStack_Previews: PreviewProvider {
    static var previews: some View {
        MyZStack()
    }
}



