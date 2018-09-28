//
//  ScoreLabel.swift
//  ColorSwitch
//
//  Created by Pavel Kotlyar on 28/9/18.
//  Copyright © 2018 Pavel Kotlyar. All rights reserved.
//

import SpriteKit

class ScoreLabel {
    var scoreLabelNode = SKLabelNode(text: "0")
    
    init(frame: CGRect) {
        scoreLabelNode.fontName = "AvenirNext-Bold"
        scoreLabelNode.fontSize = 60.0
        scoreLabelNode.fontColor = UIColor.white
        scoreLabelNode.position = CGPoint(x: frame.midX, y: frame.midY)
        scoreLabelNode.zPosition = ZPositions.label
    }
    
    func updateScore(score: Int) {
        scoreLabelNode.text = "\(score)"
    }
}
