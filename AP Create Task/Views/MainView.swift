//
//  ContentView.swift
//  AP Create Task
//
//  Created by Benjamin Lavallee on 2025-04-03.
//

import SwiftUI

struct MainView: View {
    
    // MARK: Stored properties
    @State var numberInputed: String = ""
    @State var binaryArray: [Binary] = []

    // MARK: Computed properties
    var body: some View {
        HStack {
            // Left Side (Encoder)
            VStack(spacing: 20) {
                
                TextField("Input a number", text: $numberInputed)
                    .padding()
                    .frame(width: 300, height: 50)
                
                Button("Convert to Binary") {
                    if let num = Int(numberInputed) {
                        binaryArray = convertToBinary(number: num)
                    } else {
                        binaryArray = []
                    }
                }
                .padding()

                Text("Binary:")
                    .font(.headline)

                HStack {
                    ForEach(binaryArray) { bit in
                        Text("\(bit.digit)")
                            .font(.system(size: 32))
                            .monospacedDigit()
                    }
                }

                Spacer()
            }

            // Right Side (Decoder)
            
            
            
        }
        .padding()
    }
}
