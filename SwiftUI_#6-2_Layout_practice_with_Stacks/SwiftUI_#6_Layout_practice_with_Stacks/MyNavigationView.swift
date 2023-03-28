//
//  MyNavigationView.swift
//  SwiftUI_#6_Layout_practice_with_Stacks
//
//  Created by hoonsbrand on 2023/03/28.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        
        NavigationView {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//                .navigationTitle("안녕하세요!")
//                .navigationBarTitleDisplayMode(.inline)
            MyList()
                .navigationTitle("안녕하세요!")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("호호") {
                            print("호호")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination:
                            Text("넘어온 화면입니다.")
                        ) {
                            Image(systemName: "bookmark.fill")
                                .font(.system(size: 25))
                                .foregroundColor(.orange)
                        }
                    }
                }
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
