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
    
    @State var binaryInput: String = ""
    @State var decodedNumber: Int?
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            
            // Left Side (Encoder)
            VStack(spacing: 20) {
                Text("Decimal → Binary")
                    .font(.title2)
                
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
            .padding()
            
            Divider()
            
            // Right Side (Decoder)
            VStack(spacing: 20) {
                Text("Binary → Decimal")
                    .font(.title2)
                
                TextField("Input binary number", text: $binaryInput)
                    .padding()
                    .frame(width: 300, height: 50)
                Button("Convert to Decimal") {
                    if let binaryInt = Int(binaryInput) {
                        decodedNumber = decodeFromBinary(binaryNumber: binaryInt)
                    } else {
                        decodedNumber = nil
                    }
                }
                .padding()
                
                Text("Decimal:")
                    .font(.headline)
                
                if let result = decodedNumber {
                    Text("\(result)")
                        .font(.system(size: 32))
                        .monospacedDigit()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
