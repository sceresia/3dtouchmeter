//
//  GameScene.swift
//  MyForceMeter
//
//  Created by Stephen on 2016-07-22.
//  Copyright (c) 2016 Stephen Ceresia. All rights reserved.
//

import SpriteKit

let meterBackground =  SKSpriteNode()
let fillNode = SKSpriteNode()
let defaultString = "READY"
let pressureAmount = SKLabelNode(text: defaultString)
let maxPressure = CGFloat(6.66)

class GameScene: SKScene {
  override func didMoveToView(view: SKView) {
    
    self.backgroundColor = SKColor.whiteColor()
    
    // the meter background
    meterBackground.color = SKColor.blackColor()
    meterBackground.size = CGSizeMake(CGRectGetMidX(self.frame)/8, CGRectGetMidY(self.frame))
    meterBackground.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
    self.addChild(meterBackground)
    
    // the meter fill
    fillNode.color = SKColor.greenColor()
    fillNode.size = CGSizeMake(meterBackground.frame.size.width, 0)
    fillNode.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame) - meterBackground.frame.size.height/2)
    fillNode.anchorPoint = CGPointMake(0.5, 0.0);
    fillNode.alpha = 0.8
    fillNode.zPosition = 999
    self.addChild(fillNode)
    
    // the label
    pressureAmount.fontColor = SKColor.greenColor()
    pressureAmount.fontSize = 48
    pressureAmount.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMaxY(self.frame) - CGRectGetMaxY(self.frame)/8)
    self.addChild(pressureAmount)
    
  }
  
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
  }
  
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    for touch in touches {
      if touch.force < maxPressure {
        fillNode.runAction(SKAction.resizeToHeight(CGFloat(touch.force*55), duration: 0))
        fillNode.color = SKColor.greenColor()
        pressureAmount.text = String(format: "%.2f", touch.force)
        pressureAmount.fontColor = SKColor.greenColor()
      } else {
        fillNode.runAction(SKAction.resizeToHeight(meterBackground.frame.size.height, duration: 0))
        fillNode.color = SKColor.redColor()
        pressureAmount.text = "MAX"
        pressureAmount.fontColor = SKColor.redColor()
      }
    }
  }
  
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    fillNode.runAction(SKAction.resizeToHeight(0, duration: 0))
    pressureAmount.text = defaultString
    pressureAmount.fontColor = SKColor.greenColor()
  }
  
  override func update(currentTime: CFTimeInterval) {
    /* Called before each frame is rendered */
  }
  
}
