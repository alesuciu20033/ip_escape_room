//
//  GameScene.swift
//  game-interface
//
//  Created by Nedyalko Tenev on 24/06/2024.
//

import SpriteKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        // Load and set the background image
        let backgroundImage = SKSpriteNode(imageNamed: "game_background")
        backgroundImage.position = CGPoint(x: size.width/2, y: size.height/2)
        backgroundImage.zPosition = -1 // Ensure it's behind other nodes
        // Scale the image to fit the scene without stretching
        backgroundImage.scale(to: CGSize(width: size.width, height: size.height))
        addChild(backgroundImage)
        //backgroundColor = SKColor.black

        let label = SKLabelNode(text: "Escape Room")
        label.fontSize = 45
        label.fontColor = SKColor.white
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(label)
    }
}
