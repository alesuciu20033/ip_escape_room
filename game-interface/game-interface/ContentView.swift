//
//  ContentView.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 22/06/2024.
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to the Cyberpunk Escape Room")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                NavigationLink(destination: EscapeRoomView(scene: EscapeRoomScene())) {
                    Text("Start Escape Room")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Escape Room")
        }
    }
}


#Preview {
    ContentView()
}
