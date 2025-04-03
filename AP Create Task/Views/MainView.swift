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
    
    @State private var history: [ConversionRecord] = []  // Stores conversion history
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                // Encoder + Decoder Side-by-side
                HStack(alignment: .top, spacing: 40) {
                    
                    // Left Side (Encoder)
                    VStack(spacing: 20) {
                        Text("Decimal → Binary")
                            .font(.title2)
                        
                        TextField("Input a number", text: $numberInputed)
                            .padding()
                            .frame(width: 300, height: 50)
                        
                        Button("Convert to Binary") {
                            if let num = Int(numberInputed) {
                                let result = convertToBinary(number: num)
                                binaryArray = result
                                
                                let binaryString = result.map { String($0.digit) }.joined()
                                
                                history.append(ConversionRecord(
                                    input: "\(num)",
                                    output: binaryString,
                                    type: .decimalToBinary
                                ))
                            } else {
                                binaryArray = []
                            }
                        }
                        .padding()
                        
                        Text("Binary:")
                            .font(.headline)
                        
                        HStack(spacing: 10) {
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
                                let result = decodeFromBinary(binaryNumber: binaryInt)
                                decodedNumber = result

                                history.append(ConversionRecord(
                                    input: binaryInput,
                                    output: "\(result)",
                                    type: .binaryToDecimal
                                ))
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
                
                
                // History View BELOW both sections
                HistoryView(previousResults: history)
                    .frame(maxWidth: .infinity)
            }
            .navigationTitle("Binary Converter")
            .padding()
        }
    }
}
