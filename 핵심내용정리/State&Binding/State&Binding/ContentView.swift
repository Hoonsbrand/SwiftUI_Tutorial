//
//  ContentView.swift
//  State&Binding
//
//  Created by hoonsbrand on 2023/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresenting = false
    @State private var number: Int = 177
    
    var body: some View {
        
        VStack {
            Text("Number is \(number)")
                .fontWeight(.semibold)
                .font(.system(size: 30))
                .padding(.bottom, 20)
            
            Button(action: {
                self.number += 1
            }) {
                Text("Add")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(10)
            }
            .background(Color.green)
            .cornerRadius(20)
            .padding(50)
            
            Button(action: {
                self.isPresenting = true
            }) {
                Text("Move to Check")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .padding(10)
            }
            .background(Color.blue)
            .cornerRadius(20)
            .padding(50)
            .sheet(isPresented: $isPresenting) {
                DetailView(number: $number)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
