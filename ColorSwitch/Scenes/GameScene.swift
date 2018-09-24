//
//  GameScene.swift
//  ColorSwitch
//
//  Created by Pavel Kotlyar on 24/9/18.
//  Copyright © 2018 Pavel Kotlyar. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var colorSwitch: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        layoutScene()
    }
    
    func layoutScene() {
        backgroundColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
        drawColorSwitchControl()
        spawnBall()
    }
    
    func drawColorSwitchControl() {
        colorSwitch = SKSpriteNode(imageNamed: "ColorCircle")
        colorSwitch.size = CGSize(width: frame.size.width / 3, height: frame.size.width / 3)
        colorSwitch.position = CGPoint(x: frame.midX, y: frame.minY + colorSwitch.size.height)
        addChild(colorSwitch)
    }
    
    func spawnBall() {
        let ball = SKSpriteNode(imageNamed: "ball")
        ball.position = CGPoint(x: frame.midX, y: frame.maxY)
        ball.size = CGSize(width: 30.0, height: 30.0)
        addChild(ball)
    }
}
