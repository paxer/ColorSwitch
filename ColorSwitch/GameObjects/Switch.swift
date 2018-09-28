//
//  File.swift
//  ColorSwitch
//
//  Created by Pavel Kotlyar on 28/9/18.
//  Copyright © 2018 Pavel Kotlyar. All rights reserved.
//

import SpriteKit

class Switch {
    var spriteNode: SKSpriteNode!
    var state = State.red

    enum State: Int {
        case red, yellow, green, blue
    }
    
    init(frame: CGRect) {
        spriteNode = SKSpriteNode(imageNamed: "ColorCircle")
        spriteNode.size = CGSize(width: frame.size.width / 3, height: frame.size.width / 3)
        spriteNode.position = CGPoint(x: frame.midX, y: frame.minY + spriteNode.size.height)
        spriteNode.zPosition = ZPositions.colorSwitch
        spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: spriteNode.size.width / 2)
        spriteNode.physicsBody?.categoryBitMask = PhysicsCategories.switchCategory
        spriteNode.physicsBody?.isDynamic = false
    }
    
    func turnWheel() {
        if let newState = State(rawValue: state.rawValue + 1) {
            state = newState
        } else {
            state = .red
        }
        
        spriteNode.run(SKAction.rotate(byAngle: .pi/2, duration: 0.25))
    }
    
}

