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
    @State private var unlockedEvidence: [Evidence] = []
    @State private var unlockedItems: [Item] = []
    
    let evidenceItems = [
        Evidence(title: "Note 1", content: """
        Dear Detective,

        This is your first clue. The serial killer you've been chasing is closer than you think. They blend into the crowd, a master of disguise and deception.

        Good luck, and stay vigilant.

        Yours truly,
        A Concerned Citizen
        """),
        Evidence(title: "Note 2", content: """
        Dear Detective,

        The killer has struck again. This time, they left behind a cryptic message. Pay attention to the patterns.

        Stay safe.

        A Concerned Citizen
        """)
    ]

    let itemData = [
        Item(title: "Key", description: """
        A small rusty key. It might open a lock somewhere in this escape room.
        """),
        Item(title: "Map", description: """
        An old, tattered map showing the layout of the escape room. It might reveal hidden pathways or clues.
        """)
    ]

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

            VStack {
                HStack {
                    Button(action: {
                        if !unlockedEvidence.contains(where: { $0.title == evidenceItems[0].title }) {
                            unlockedEvidence.append(evidenceItems[0])
                        }
                    }) {
                        Text("Unlock Note 1")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.leading)
                    }

                    Button(action: {
                        if !unlockedEvidence.contains(where: { $0.title == evidenceItems[1].title }) {
                            unlockedEvidence.append(evidenceItems[1])
                        }
                    }) {
                        Text("Unlock Note 2")
                            .font(.headline)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.trailing)
                    }
                    
                    Button(action: {
                        if !unlockedItems.contains(where: { $0.title == itemData[0].title }) {
                            unlockedItems.append(itemData[0])
                        }
                    }) {
                        Text("Unlock Key")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.leading)
                    }
                    
                    Button(action: {
                        if !unlockedItems.contains(where: { $0.title == itemData[1].title }) {
                            unlockedItems.append(itemData[1])
                        }
                    }) {
                        Text("Unlock Map")
                            .font(.headline)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.trailing)
                    }
                }

                Spacer()

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
            }
        }
        .fullScreenCover(isPresented: $showingEvidence) {
            NavigationView {
                EvidenceView(unlockedEvidence: $unlockedEvidence, unlockedItems: $unlockedItems)
            }
        }
    }
}
