//
//  ContentView.swift
//  darkpass
//
//  Created by Aaron West on 9/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var command: String = ""
    @State private var output: String = "Welcome to Dark Pass. Type 'help' for commands."

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Dark Pass")
                    .font(.system(size: 24, weight: .bold, design: .monospaced))
                    .foregroundColor(.purple)
                    .padding()
                
                ScrollView {
                    Text(output)
                        .font(.system(size: 14, design: .monospaced))
                        .foregroundColor(.green)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                
                HStack {
                    Text(">")
                        .foregroundColor(.green)
                        .font(.system(size: 16, design: .monospaced))
                    
                    TextField("Enter command", text: $command)
                        .foregroundColor(.green)
                        .font(.system(size: 16, design: .monospaced))
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onSubmit {
                            processCommand()
                        }
                }
                .padding()
                .background(Color.black)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.green, lineWidth: 1)
                )
                .padding()
            }
        }
    }
    
    private func processCommand() {
        // Here you'll implement the logic to process commands
        output += "\n> \(command)"
        
        switch command.lowercased() {
        case "help":
            output += "\nAvailable commands: help, clear"
        case "clear":
            output = "Welcome to Dark Pass. Type 'help' for commands."
        default:
            output += "\nUnknown command: \(command)"
        }
        
        command = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
