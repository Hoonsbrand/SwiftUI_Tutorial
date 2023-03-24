//
//  DetailView.swift
//  State&Binding
//
//  Created by hoonsbrand on 2023/03/24.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var number: Int
    
    // MARK: - init
    
    init(number: Binding<Int> = .constant(7)) {
        _number = number
    }
    
    var body: some View {
        Text("Number : \(number)")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
