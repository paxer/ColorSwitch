//
//  Menu.swift
//  ColorSwitch
//
//  Created by Pavel Kotlyar on 25/9/18.
//  Copyright © 2018 Pavel Kotlyar. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    override func didMove(to view: SKView) {
        layoutScene()
    }
    
    func layoutScene() {
        backgroundColor = LayoutProperties.backgroundColor
        addLogo()
        addLables()
    }
    
    func addLogo() {
        let logo = SKSpriteNode(imageNamed: "logo")
        logo.size = CGSize(width: frame.size.width / 4, height: frame.size.width / 4)
        logo.position = CGPoint(x: frame.midX, y: frame.midY + frame.size.height / 4)
        addChild(logo)
    }

    func addLables() {
        let playLabel = SKLabelNode(text: "Tap to play!")
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontSize = 50.0
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(playLabel)
        
        let highScoreLabel = SKLabelNode(text: "Highscore:")
        highScoreLabel.fontName = "AvenirNext-Bold"
        highScoreLabel.fontSize = 40.0
        highScoreLabel.fontColor = UIColor.white
        highScoreLabel.position = CGPoint(x: frame.midX, y: frame.midY - highScoreLabel.frame.size.height * 4)
        addChild(highScoreLabel)

        let recentScoreLab = SKLabelNode(text: "Recent score:")
        recentScoreLab.fontName = "AvenirNext-Bold"
        recentScoreLab.fontSize = 40.0
        recentScoreLab.fontColor = UIColor.white
        recentScoreLab.position = CGPoint(x: frame.midX, y: highScoreLabel.position.y - recentScoreLab.frame.size.height * 2)
        addChild(recentScoreLab)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let gameScene = GameScene(size: view!.bounds.size)
        view!.presentScene(gameScene)
    }
}
