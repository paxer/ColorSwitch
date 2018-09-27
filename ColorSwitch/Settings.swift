//
//  Settings.swift
//  ColorSwitch
//
//  Created by Pavel Kotlyar on 24/9/18.
//  Copyright © 2018 Pavel Kotlyar. All rights reserved.
//

import SpriteKit

enum PhysicsCategories {
    static let none: UInt32 = 0
    static let ballCategory: UInt32 = 0x1         // 01
    static let switchCategory: UInt32 = 0x1 << 1  // 10
}

enum ZPositions {
    static let label: CGFloat = 0
    static let ball: CGFloat = 1
    static let colorSwitch: CGFloat = 2
}

enum LayoutProperties {
    static let backgroundColor: UIColor = UIColor(red: 44/255, green: 62/255, blue: 80/255, alpha: 1.0)
}

enum PlayColors {
    static let colors = [
        UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1.0),
        UIColor(red: 241/255, green: 196/255, blue: 15/255, alpha: 1.0),
        UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1.0),
        UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0),
        ]
}
