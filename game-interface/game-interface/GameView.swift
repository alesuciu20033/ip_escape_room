//
//  GameView.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 24/06/2024.
//

import SwiftUI
import SpriteKit

struct GameView: View {
    @State private var showingEvidence = false
    
    var scene: SKScene {
        let scene = GameScene()
        scene.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scene.scaleMode = .aspectFill
        return scene
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            SpriteView(scene: scene)
                .edgesIgnoringSafeArea(.all)
                .background(Color.black)
            
            Button(action: {
                showingEvidence = true
            }) {
                Image(systemName: "backpack")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .padding()
            }
            .fullScreenCover(isPresented: $showingEvidence) {
                NavigationView {
                    EvidenceView()
                }
            }
        }
    }
}
