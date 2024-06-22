//
//  EscapeRoomView.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 22/06/2024.
//
import SwiftUI
import SpriteKit

struct EscapeRoomView: View {
    
    var scene: EscapeRoomScene
    
    var body: some View {
        VStack {
            Text("You found a clue!")
                .font(.title)
                .foregroundColor(.white)
            
            // Example: Displaying text from the found evidence
            Text("The encrypted message reads: 'Find the hidden switch under the gears.'")
                .foregroundColor(.white)
                .padding()
            
            // SpriteKit view displaying the escape room scene
            SpriteKitView(scene: scene)
                .frame(width: 300, height: 300)
                .border(Color.white, width: 2)
                .padding()
            
           // NavigationLink(destination: NextView()) {
            NavigationLink(destination: ContentView()) {
                Text("Continue")
                    .font(.title2)
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

struct SpriteKitView: UIViewRepresentable {
    
    let scene: SKScene
    
    func makeUIView(context: Context) -> SKView {
        let skView = SKView(frame: .zero)
        skView.presentScene(scene)
        return skView
    }
    
    func updateUIView(_ uiView: SKView, context: Context) {
        // Update code here if needed
    }
}
