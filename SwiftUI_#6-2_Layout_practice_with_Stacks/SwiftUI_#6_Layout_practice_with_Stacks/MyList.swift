//
//  MyList.swift
//  SwiftUI_#6_Layout_practice_with_Stacks
//
//  Created by hoonsbrand on 2023/03/28.
//

import SwiftUI

struct MyList: View {
    
    private var list = ["a", "b", "c"]
    
    var body: some View {
        
//        List {
//            Section {
//                Text("마이 리스트")
//                Image(systemName: "person.fill")
//            }
//
//            Section {
//                ForEach(1..<5) {
//                    Text("마이리스트 \($0)")
//                }
//            }
//
//            Section {
//                ForEach(["하나", "둘", "셋"], id: \String.self) {
//                    Text("마이리스트 \($0)")
//                }
//            }
//        }
        
        List {

            // MARK: - 오늘 할 일
            Section {
                ForEach(list, id: \String.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.green)
                }
            } header: {
                Text("오늘 할 일")
                    .font(.headline)
                    .foregroundColor(.black)
            } footer: {
                Text("footer")
            }
            // 간격 설정
            .listRowInsets(.init(EdgeInsets(top: 10, leading: 80, bottom: 10, trailing: 10)))

            // MARK: - 내일 할 일
            Section {
                ForEach(1...10, id: \Int.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기 \(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.blue)
                    // 구분선 숨기기
                    .listRowSeparator(.hidden)
                }
            } header: {
                Text("내일 할 일")
                    .font(.headline)
                    .foregroundColor(.black)
            } footer: {
                Text("footer")
            }
            .listRowInsets(.init(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)))
            .listRowBackground(Color.yellow)

        }
        // List 스타일 설정
        .listStyle(.grouped)

        // Navigation title 설정
        .navigationTitle("내 목록")
        .navigationBarTitleDisplayMode(.large)

    }
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}





