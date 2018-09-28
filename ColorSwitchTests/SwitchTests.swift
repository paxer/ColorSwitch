//
//  SwitchTests.swift
//  ColorSwitchTests
//
//  Created by Pavel Kotlyar on 28/9/18.
//  Copyright © 2018 Pavel Kotlyar. All rights reserved.
//

import XCTest
@testable import ColorSwitch

class SwitchTests: XCTestCase {
    var colorSwitch: Switch!
    
    override func setUp() {
        colorSwitch = Switch(frame: CGRect(x: 9, y: 9, width: 9, height: 0))
    }
            
    func testInitialStateIsRed() {
        XCTAssertEqual(colorSwitch.state, Switch.State.red, "Initial color state is red")
    }
    
    func testSpriteNodeSize() {
        XCTAssertEqual(colorSwitch.spriteNode.size.width, 3.0, "Sptite Node size width is frame width devided by 3")
        XCTAssertEqual(colorSwitch.spriteNode.size.height, 3.0, "Sptite Node size height is frame width devided by 3")
    }
    
    func testSpriteNodePosition() {
        XCTAssertEqual(colorSwitch.spriteNode.position.x, 13.5, "Sptite x position is frame.midX")
        XCTAssertEqual(colorSwitch.spriteNode.position.y, 12.0, "Sptite x position is frame.minY + spriteNode.size.height")
        XCTAssertEqual(colorSwitch.spriteNode.zPosition, 2, "Sptite z position is 1")
    }
    
    func testPhysicsBody() {
        XCTAssertEqual(colorSwitch.spriteNode.physicsBody!.categoryBitMask, PhysicsCategories.switchCategory, "Sptite physicsBody is 2")
        XCTAssertFalse(colorSwitch.spriteNode.physicsBody!.isDynamic, "Sptite physicsBody isDynamic false")
    }
    
    func testTurnWheel() {
        colorSwitch.turnWheel()
        XCTAssertEqual(colorSwitch.state, Switch.State.yellow)
        colorSwitch.turnWheel()
        XCTAssertEqual(colorSwitch.state, Switch.State.green)
        colorSwitch.turnWheel()
        XCTAssertEqual(colorSwitch.state, Switch.State.blue)
        colorSwitch.turnWheel()
        XCTAssertEqual(colorSwitch.state, Switch.State.red)
    }
}
