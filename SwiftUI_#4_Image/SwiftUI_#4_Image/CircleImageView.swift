//
//  CircleImageView.swift
//  SwiftUI_#4_Image
//
//  Created by hoonsbrand on 2023/03/19.
//

import SwiftUI

struct CircleImageView: View {
    var body: some View {
//        Image(systemName: "bolt.circle")
//            .font(.system(size: 200))
//            .foregroundColor(.yellow)
//            .shadow(color: .gray, radius: 2, x: 2, y: 10)
        
        Image("backgroundImage")
//            .resizable()
            .frame(width: 100, height: 100)
            .clipped()
            
            
//
//        Image("hoonImage") // SwiftUI에서는 파라미터 없이 이미지의 이름만 넣어주면 된다.
//            .resizable() // 이미지를 화면의 사이즈에 맞춘다.
//            .scaledToFill() // aspectRatio와 동일
//            .frame(width: 300, height: 300) // 이미지 크기 조절
//            .clipShape(Circle()) // 이미지를 지정한 모양으로 자른다.
//            .shadow(color: .gray, radius: 10, x: 0, y: 10)
//            .overlay(
//                Circle()
//                .foregroundColor(.black)
//                .opacity(0.5)
//            )
//            .overlay(            // 뷰를 중첩시킨다.
//                Circle()
//                .stroke(Color.blue,
//                        lineWidth: 10)
//            )
//            .overlay(            // 뷰를 중첩시킨다.
//                Circle()
//                .stroke(Color.red,
//                        lineWidth: 10)
//                .padding()
//            )
//            .overlay(            // 뷰를 중첩시킨다.
//                Circle()
//                .stroke(Color.yellow,
//                        lineWidth: 10)
//                .padding(30)
//            )
//            .overlay(            // 뷰를 중첩시킨다.
//                Text("Hoon").foregroundColor(.white)
//                    .font(.system(size: 50))
//                    .fontWeight(.bold)
//            )
//
//            .aspectRatio(contentMode: .fill) // 비율
////            .clipped() // 설정한 이미지의 크기 이상을 자른다.
//            .edgesIgnoringSafeArea(.all) // SafeArea 무시
//
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}



