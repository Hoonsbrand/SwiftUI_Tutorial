//
//  MyBasicCard.swift
//  SwiftUI_#6_Layout_practice_with_Stacks
//
//  Created by hoonsbrand on 2023/03/21.
//

import SwiftUI

struct MyBasicCard: View {
    var body: some View {
        
        HStack(spacing: 20) {
            
            Image(systemName: "flag.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 0) {
                // Divider나 Rectangle을 사용하여 VStack 내 최대 width로 세팅해 화면
                // 양끝 까지 확장
//                Divider().opacity(0)
//                Rectangle().frame(height: 0)
                
                Text("하하하")
                    .fontWeight(.bold)
                    .font(.system(size: 23))
                    .foregroundColor(Color.white)
                
                Spacer().frame(height: 5)
                
                Text("하하하")
                    .foregroundColor(Color.white)
                
            }
            
            Spacer()
            
        }
        .padding(20)
        .background(Color.purple)
        .cornerRadius(20)
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}

