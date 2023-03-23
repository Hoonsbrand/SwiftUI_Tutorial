//
//  MyProjectCard.swift
//  SwiftUI_#6_Layout_practice_with_Stacks
//
//  Created by hoonsbrand on 2023/03/21.
//

import SwiftUI

struct MyProjectCard: View {
    
    @State private var shouldShowAlert: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            // Circle을 정렬하기 위한 투명 View
//            Rectangle().frame(height: 0)
            
            Text("정대리 SwiftUI 수강하기")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
                
            Text("10 AM - 11 AM")
                .foregroundColor(.secondary)
            
            Spacer().frame(height: 20)
            
            HStack {
                Image("1")
                    .resizable() // frame에 맞게끔 이미지 크기 조절
                    .frame(width: 50, height: 50)
                    .clipShape(Circle()) // 이미지를 자르는데 어떤 모양으로 자를것인가
                    .overlay(            // Circle.stroke를 overlay해 테두리 만들기 
                        Circle()
                            .stroke(lineWidth: 5)
                            .foregroundColor(.blue)
                    )
                
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Spacer()
                
                Button(action: {
                    print("DEBUG: 확인 버튼이 클릭되었다.")
                    
                    self.shouldShowAlert = true
                    
                }) {
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창입니다!"))
                }
    
            }
        }
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
        
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}




