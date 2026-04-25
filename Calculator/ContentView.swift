//
//  ContentView.swift
//  Calculator
//
//  Created by Lev on 25.04.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    @State private var firstNumber: Double = 0
    @State private var currentOperation: String? = nil
    
    let buttons: [[String]] = [["7", "8", "9", "-"], ["4", "5", "6", "+"], ["1", "2", "3", "="], ["0", "C"]]
    var body: some View {
        Spacer()
        VStack {
            HStack {
                Spacer()
                Text(display)
                    .font(.largeTitle)
                    .padding()
            }
            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { item in
                        Button(action: {buttonTapped(item)}) {
                            Text(item)
                                .font(.title)
                                .frame(width: 70, height: 70)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(35)
                        }
                    }
                }
            }
        }
        .padding()
    }
    func buttonTapped(_ value: String) {
        switch value {
        case "0"..."9":
            if display == "0" {
                display = value
            } else {
                display += value
            }
        case "+", "-":
            firstNumber = Double(display) ?? 0
            currentOperation = value
            display = "0"
        case "=":
            let secondNumber = Double(display) ?? 0
            if currentOperation == "+" {
                display = String(firstNumber + secondNumber)
            } else if currentOperation == "-" {
                display = String(firstNumber - secondNumber)
            }
        case "C":
            display = "0"
            firstNumber = 0
            currentOperation = nil
        default:
            break
        }
    }
}
