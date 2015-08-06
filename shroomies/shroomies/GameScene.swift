//
//  GameScene.swift
//  shroomies
//
//  Created by the Soo-Rae's Mac on 7/30/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var eater = SKSpriteNode()
    var shroom = SKSpriteNode()

    var tree = SKSpriteNode()
    var movingObjects = SKNode()
    
    var eaterGroup : UInt32 = 0x1 << 1
    var objectGroup : UInt32 = 0x1 << 2

    var shroomGroup : UInt32 = 0x1 << 3
    
    var score = 0
    var scoreLabel = SKLabelNode()

    
    var points = 0
    
    var gameOver = 0

    
    override func didMoveToView(view: SKView) {
    
        /* Setup your scene here */
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0,-2)
        self.addChild(movingObjects)
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPointMake(CGRectGetMidY(self.frame), (self.frame.size.height-70))
        self.addChild(scoreLabel)
        
        self.backgroundColor = SKColor.greenColor()
      //  self.scaleMode = SKSceneScaleMode.AspectFit
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect:self.frame)
    

        
        
        
        var eaterTexture = SKTexture(imageNamed: "pacman")
        var eaterTexture2 = SKTexture(imageNamed: "pacman-open")
        var animation = SKAction.animateWithTextures([eaterTexture, eaterTexture2], timePerFrame: 0.2)
        var eaterEat = SKAction.repeatActionForever(animation)
        
        eater = SKSpriteNode(texture: eaterTexture)
        eater.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        eater.runAction(eaterEat)
        
        eater.physicsBody = SKPhysicsBody(circleOfRadius: eater.size.height/2)
        eater.physicsBody?.dynamic = true
        eater.physicsBody?.allowsRotation = false
        // eater.zPosition = 10
        eater.physicsBody?.categoryBitMask = eaterGroup
        eater.physicsBody?.collisionBitMask = objectGroup
        eater.physicsBody?.contactTestBitMask = objectGroup
        eater.physicsBody?.collisionBitMask = shroomGroup
        
        self.addChild(eater)
        
        var ground = SKNode()
        ground.position = CGPointMake(0, 20)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        ground.physicsBody!.dynamic = false
        ground.physicsBody?.categoryBitMask = objectGroup
        self.addChild(ground)
        
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: Selector("makeShrooms"), userInfo: nil, repeats: true)
    }
    
    func makeShrooms(){
        if gameOver == 0 {
            var height1: Int = Int(self.frame.height)
            var height2 = UInt32(height1)
            var newY = Int(arc4random_uniform(height2))
            var newX = Int(self.frame.width + 10)
            var p = CGPoint(x:newX, y:newY)
            var destination = CGPoint(x:0, y:newY)
            
            createShroom(p)
            
        
        }}
        
        func createShroom(p:CGPoint){
            var moveShroom = SKAction.moveByX(-self.frame.size.width * 2, y:0, duration: NSTimeInterval(self.frame.size.width/100))
            var removeShroom = SKAction.removeFromParent()
            var moveAndRemoveShroom = SKAction.sequence([moveShroom, removeShroom])
            
var whichShroom = String()
            var x = Int(arc4random()%2)
            if x == 0 {whichShroom = "chanterelle"
                points = 100}
            else {whichShroom = "porcini"
            points = 200}
            let shroom = SKSpriteNode(imageNamed: whichShroom)
        shroom.position = p
            shroom.runAction(moveAndRemoveShroom)
            shroom.physicsBody = SKPhysicsBody(rectangleOfSize: shroom.size)
            shroom.physicsBody!.dynamic = false
            shroom.physicsBody?.categoryBitMask = shroomGroup

            
            movingObjects.addChild(shroom)
        }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
            eater.physicsBody!.velocity = CGVectorMake(100,100)
            eater.physicsBody!.applyImpulse(CGVectorMake(20, 300)
)

                }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == shroomGroup || contact.bodyB.categoryBitMask == shroomGroup
        {        println("contact made")
 score += points
        scoreLabel.text = "\(score)"
    }
     }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
