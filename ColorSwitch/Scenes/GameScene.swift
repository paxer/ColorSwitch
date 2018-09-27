//
//  GameScene.swift
//  ColorSwitch
//
//  Created by Pavel Kotlyar on 24/9/18.
//  Copyright © 2018 Pavel Kotlyar. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    var colorSwitch: ColorSwitch!
    var currentColorIndex: Int?
    let scoreLabel = SKLabelNode(text: "0")
    var score = 0
    var gravity = -2.0
    
    override func didMove(to view: SKView) {
        setupPhysics()
        layoutScene()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        colorSwitch.turnWheel()
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if contactMask == PhysicsCategories.ballCategory | PhysicsCategories.switchCategory {
            if let ball = contact.bodyA.node?.name == "Ball" ? contact.bodyA.node as? SKSpriteNode : contact.bodyB.node as? SKSpriteNode {
                detectColorMatch(ball: ball)
            }
        }
    }
    
    func detectColorMatch(ball: SKSpriteNode) {
        if currentColorIndex ==  colorSwitch.state.rawValue {
            run(SKAction.playSoundFileNamed("bling", waitForCompletion: false))
            score += 1
            updateScoreLabel()
            updateWorldGravity()
            ball.run(SKAction.fadeOut(withDuration: 0.25)) {
                ball.removeFromParent()
                self.spawnBall()
            }
        } else {
            gameOver()
        }        
    }
    
    func updateWorldGravity() {
        gravity -= 0.1
        physicsWorld.gravity = CGVector(dx: 0.0, dy: gravity)
    }
    
    func setupPhysics()  {
        physicsWorld.gravity = CGVector(dx: 0.0, dy: gravity)
        physicsWorld.contactDelegate = self
    }
    
    func layoutScene() {
        backgroundColor = LayoutProperties.backgroundColor
        colorSwitch = ColorSwitch(frame: frame)
        addChild(colorSwitch.spriteNode)
        drawScoreLabel()
        spawnBall()
    }
    
    func drawScoreLabel() {
        scoreLabel.fontName = "AvenirNext-Bold"
        scoreLabel.fontSize = 60.0
        scoreLabel.fontColor = UIColor.white
        scoreLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        scoreLabel.zPosition = ZPositions.label
        addChild(scoreLabel)
    }
    
    func spawnBall() {
        let randomColor = PlayColors.colors.randomElement()
        currentColorIndex = PlayColors.colors.firstIndex(of: randomColor!)
        let ball = Ball(frame: frame, color: randomColor!)
        addChild(ball.spriteNode)
    }
    
    func gameOver() {
        run(SKAction.playSoundFileNamed("game_over", waitForCompletion: true)) {
            UserDefaults.standard.set(self.score, forKey: "RecentScore")
            if self.score > UserDefaults.standard.integer(forKey: "HighScore") {
                UserDefaults.standard.set(self.score, forKey: "HighScore")
            }
            let menuScene = MenuScene(size: self.view!.bounds.size)
            self.view!.presentScene(menuScene)
        }
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }
}
