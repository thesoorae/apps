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
    var porcini = SKSpriteNode()
    var chant = SKSpriteNode()
    var tree = SKSpriteNode()
    var movingObjects = SKSpriteNode()
    
    var eaterGroup : UInt32 = 1
    var shroomGroup : UInt32 = 2
    var objectGroup : UInt32 = 3
    
    var score = 0
    var scoreLabel = SKLabelNode()
    var moverSpeed = 10.0
    let moveFactor = 1.05
    
    var points = 0
    
    var gameOver = 0

    
    override func didMoveToView(view: SKView) {
    
        /* Setup your scene here */
        
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPointMake(CGRectGetMidY(self.frame), (self.frame.size.height-70))
        self.addChild(scoreLabel)
        
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0,-5)
        self.addChild(movingObjects)

    
    
        var eaterTexture = SKTexture(imageNamed: "pacman")
        var eaterTexture2 = SKTexture(imageNamed: "pacman-open")
        var animation = SKAction.animateWithTextures([eaterTexture, eaterTexture2], timePerFrame: 0.2)
        var eaterEat = SKAction.repeatActionForever(animation)
        
        eater = SKSpriteNode(texture: eaterTexture)
        eater.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        eater.runAction(eaterEat)
        
        eater.physicsBody = SKPhysicsBody(circleOfRadius: eater.size.height/2)
        eater.physicsBody?.dynamic = true
        eater.physicsBody?.allowsRotation = true
        eater.zPosition = 10
        eater.physicsBody?.categoryBitMask = eaterGroup
        eater.physicsBody?.collisionBitMask = objectGroup
        eater.physicsBody?.contactTestBitMask = objectGroup
        eater.physicsBody?.collisionBitMask = shroomGroup
        
        self.addChild(eater)
        
        var ground = SKNode()
        ground.position = CGPointMake(0,0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        ground.physicsBody?.dynamic = false
        ground.physicsBody?.categoryBitMask = objectGroup
        self.addChild(ground)
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("makeShrooms"), userInfo: nil, repeats: true)
    }
    
    func makeShrooms(){
        if gameOver == 0 {
            
            
            var newY = Int(arc4random()%1024)
            var newX = Int(self.frame.width + 10)
            var p = CGPoint(x:newX, y:newY)
            var destination = CGPoint(x:0, y:newY)
            
            createShroom(p, destination:destination)
            
        
        }}
        
        func createShroom(p:CGPoint, destination:CGPoint){
var whichShroom = String()
            var x = Int(arc4random()%2)
            if x == 0 {whichShroom = "chanterelle"
                points = 100}
            else {whichShroom = "porcini"
            points = 200}
            let shroom = SKSpriteNode(imageNamed: whichShroom)
        shroom.position = p
            shroom.physicsBody?.categoryBitMask = shroomGroup
            let duration = NSTimeInterval(moverSpeed)
            let action = SKAction.moveTo(destination, duration: duration)
            shroom.runAction(SKAction.repeatActionForever(action))
            movingObjects.addChild(shroom)
        }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        if gameOver == 0 {
            eater.physicsBody?.velocity = CGVectorMake(0,0)
            eater.physicsBody?.applyImpulse(CGVectorMake(0, 50))

        }
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
