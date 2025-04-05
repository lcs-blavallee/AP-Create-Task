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
    @State var binaryArray: [Binary] = [] // Stores the Binary in the empty array to reduce complexity
    
    @State var binaryInput: String = ""
    @State var decodedNumber: Int?
    
    @State private var history: [ConversionRecord] = []  // Stores conversion history in empty array
    
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
                        
                        // Takes inputed number
                        TextField("Input a number", text: $numberInputed)
                            .padding()
                            .frame(width: 300, height: 50)
                        
                        Button("Convert to Binary") {
                            
                            // try to convert a string from a text field into an integer
                            
                            if let num = Int(numberInputed) {
                                let result = convertToBinary(number: num)
                                binaryArray = result
                                
                                // turn an array of Binary objects into a single string representing the full binary number.
                                
                                let binaryString = result.map { String($0.digit) }.joined()
                                
                                // append the history to the conversionRecord array with the specific parameters
                                
                                history.append(ConversionRecord(
                                    input: "\(num)",
                                    output: binaryString,
                                    type: .decimalToBinary
                                ))
                            } else {
                                
                                // if text/symbols are entered, conversion fails, clear binary array
                                
                                binaryArray = []
                            }
                        }
                        .padding()
                        
                        Text("Binary:")
                            .font(.headline)
                        
                        HStack(spacing: 10) {
                            
                            // iterate over each bit in the binary array to display the binary number
                            
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
                            
                            //try to convert a string from a text field into an integer
                            
                            if let binaryInt = Int(binaryInput) {
                                
                                // if it is a number, invoke decodeFromBinary function to make the conversion
                                let result = decodeFromBinary(binaryNumber: binaryInt)
                                decodedNumber = result
                                
                               // append the conversion to the history

                                history.append(ConversionRecord(
                                    input: binaryInput,
                                    output: "\(result)",
                                    type: .binaryToDecimal
                                ))
                            } else {
                                
                                // if number entered isn't a number, return nil
                                
                                decodedNumber = nil
                            }
                        }
                        .padding()
                        
                        Text("Decimal:")
                            .font(.headline)
                        
                        // display the decoded binary number (result) as a decimal
                        
                        if let result = decodedNumber {
                            Text("\(result)")
                                .font(.system(size: 32))
                                .monospacedDigit()
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
                
                
                // History View below both sections
                HistoryView(previousResults: history)
                    .frame(maxWidth: .infinity)
            }
            .navigationTitle("Binary Converter")
            .padding()
        }
    }
}
