//
//  EscapeRoomScene.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 22/06/2024.
//

import SwiftUI
import SpriteKit

// Custom SpriteKit scene for the escape room
class EscapeRoomScene: SKScene {
    
    override func didMove(to view: SKView) {
        // Setup your scene here
        backgroundColor = .black
        
        // Example: Add a cyberpunk-themed background
        let background = SKSpriteNode(imageNamed: "cyberpunk_background")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(background)
        
        // Example: Add steampunk elements or animations
        let gearsAnimation = SKAction.repeatForever(SKAction.rotate(byAngle: .pi, duration: 5.0))
        let gears = SKSpriteNode(imageNamed: "steampunk_gears")
        gears.position = CGPoint(x: size.width * 0.8, y: size.height * 0.2)
        gears.run(gearsAnimation)
        addChild(gears)
    }
}
