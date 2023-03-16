//
//  MyVStackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by hoonsbrand on 2023/03/09.
//

import SwiftUI

struct MyVStackView: View {
    
    // 데이터를 연동시킨다
    @Binding
    var isActivated: Bool
    
    // 생성자
    init(isActivated: Binding<Bool> = .constant(false)) {
        _isActivated = isActivated
    }
    
    var body: some View {
        VStack {
            Text("1!")
                .fontWeight(.bold)
                .font(.system(size: 60))
            
            Text("2!")
                .fontWeight(.bold)
                .font(.system(size: 60))
            
            Text("3!")
                .fontWeight(.bold)
                .font(.system(size: 60))
        }   // VStack
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}

// 보여주는 용도
struct MyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVStackView()
    }
}
