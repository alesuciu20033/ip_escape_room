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
            GeometryReader { geometry in
                HStack(spacing: geometry.size.width * 0.1) {
                    NavigationLink(destination: EvidenceView()) {
                        Text("Open Backpack")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    NavigationLink(destination: GameView()) {
                        Text("Start Game")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .navigationBarBackButtonHidden(true)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
#Preview {
    ContentView()
}
