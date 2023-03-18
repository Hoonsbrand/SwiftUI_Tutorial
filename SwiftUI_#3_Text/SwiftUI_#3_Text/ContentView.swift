//
//  ContentView.swift
//  SwiftUI_#3_Text
//
//  Created by hoonsbrand on 2023/03/17.
//

import SwiftUI

struct ContentView: View {
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일"
//        formatter.dateStyle = .long
        return formatter
    }()
    
    private var today = Date()
    
    private var trueOrFalse: Bool = false
    
    private var number: Int = 123
    
    var body: some View {
        
        VStack {
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,")
                .tracking(2) // 글자 사이의 간격
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium) // font의 두께
                .multilineTextAlignment(.center) // 글자 정렬
                .lineLimit(nil) // SwiftUI에서는 nil로 해야 multiLine이 적용된다.
                .lineSpacing(10) // 행간의 간격
                .truncationMode(.tail) // 글자가 View의 크기보다 길때 잘리는 위치
                .shadow(color: Color.red, radius: 3, x: -10, y: 10) // radius는 범위라고 생각하면된다. 숫자가 커질수록 그림자의 범위가 커져서 흐려지게 보인다.
                
                .padding(20)
                .background(Color.yellow)
                .cornerRadius(10)
                
                .padding()
                .background(Color.green)
                .cornerRadius(20)
                .padding()
            
            Text("안녕하세요!")
                .background(Color.gray)
                .foregroundColor(Color.white)
            
            Text("오늘의 날짜입니다. : \(today, formatter: ContentView.dateFormat)")
                .padding(.top)
            
            Text("참 혹은 거짓: \(String(trueOrFalse))")
                .padding(.top)
            
            Text("숫자입니다: \(number)")
                .padding(.top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
