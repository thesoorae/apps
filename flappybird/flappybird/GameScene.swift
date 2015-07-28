//
//  GameScene.swift
//  flappybird
//
//  Created by the Soo-Rae's Mac on 7/27/15.
//  Copyright (c) 2015 sourceapps. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var bird = SKSpriteNode()
var bg = SKSpriteNode()
    var score = 0
    var scoreLabel = SKLabelNode()
    var gameOverLabel = SKLabelNode()
    var labelHolder = SKSpriteNode()
    
    
    
    var pipe1 = SKSpriteNode()
    var pipe2 = SKSpriteNode()
    var birdGroup: UInt32 = 1
    var objectGroup: UInt32 = 2
    var gapGroup : UInt32 = 0 << 3
    var gameOver = 0
    var movingObjects = SKNode()
    
    override func didMoveToView(view: SKView) {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0,-5)
        self.addChild(movingObjects)
        
        scoreLabel.fontName = "Helvetica"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPointMake(CGRectGetMidY(self.frame), self.frame.size.height-70)
        self.addChild(scoreLabel)
        scoreLabel.zPosition = 11
        
       self.addChild(labelHolder)
        makeBackground()

        /* Setup your scene here */
        var birdTexture = SKTexture(imageNamed: "img/flappy1.png")
        var birdTexture2 = SKTexture(imageNamed:"img/flappy2.png")
        
        var animation = SKAction.animateWithTextures([birdTexture, birdTexture2], timePerFrame: 0.1)
        var makeBirdFlap = SKAction.repeatActionForever(animation)
        
        bird = SKSpriteNode(texture: birdTexture)
        
        bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        bird.runAction(makeBirdFlap)
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 2)
        bird.physicsBody?.dynamic = true
        bird.physicsBody?.allowsRotation = false
        bird.zPosition = 10
        bird.physicsBody?.categoryBitMask = birdGroup
        bird.physicsBody?.collisionBitMask = objectGroup
        bird.physicsBody?.contactTestBitMask = objectGroup
        bird.physicsBody?.collisionBitMask = gapGroup
        
        
    self.addChild(bird)
        
        var ground = SKNode()
        ground.position = CGPointMake(0, 0)
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(self.frame.size.width, 1))
        ground.physicsBody!.dynamic = false
        ground.physicsBody?.categoryBitMask = objectGroup
        self.addChild(ground)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: Selector("makePipes"), userInfo: nil, repeats: true)
        
        
      }
    func makeBackground(){
        var bgTexture = SKTexture (imageNamed: "img/bg.png")
        var movebg = SKAction.moveByX(-bgTexture.size().width, y:0, duration: 9)
        var replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        var movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
        
        for var i:CGFloat=0 ; i<3 ; i++ {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: bgTexture.size().width/2 + (i * bgTexture.size().width), y: CGRectGetMidY(self.frame))
            bg.size.height = self.frame.height
            bg.runAction(movebgForever)
            movingObjects.addChild(bg)
        }

    }
    
    func makePipes(){
        if gameOver == 0 {
        var movementAmount = arc4random() % UInt32(self.frame.size.height / 2)
        var pipeOffset = CGFloat(movementAmount) - self.frame.size.height / 4
        
        
        let gapHeight = bird.size.height * 4
        
        var pipeTexture1 = SKTexture(imageNamed: "img/pipe1.png")
        
        var movePipe = SKAction.moveByX(-self.frame.size.width * 2, y:0, duration:NSTimeInterval(self.frame.size.width/100))
        var removePipe = SKAction.removeFromParent()
        var moveAndRemovePipe = SKAction.sequence([movePipe, removePipe])
        
        var pipeTexture2 = SKTexture(imageNamed: "img/pipe2.png")
        pipe1 = SKSpriteNode(texture: pipeTexture1)
        pipe2 = SKSpriteNode(texture: pipeTexture2)
        pipe1.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipe1.size.height/2 + gapHeight + pipeOffset)
        pipe2.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) - pipe2.size.height/2 - gapHeight + pipeOffset)
        pipe1.runAction(moveAndRemovePipe)
        pipe2.runAction(moveAndRemovePipe)
        pipe1.physicsBody = SKPhysicsBody(rectangleOfSize: pipe1.size)
        pipe1.physicsBody!.dynamic = false
        pipe2.physicsBody = SKPhysicsBody(rectangleOfSize: pipe2.size)
        pipe2.physicsBody!.dynamic = false
        pipe1.physicsBody?.categoryBitMask = objectGroup
        pipe2.physicsBody?.categoryBitMask = objectGroup


        movingObjects.addChild(pipe1)
        movingObjects.addChild(pipe2)
            
            var gap = SKNode()
            gap.position = CGPoint(x: CGRectGetMidX(self.frame) + self.frame.size.width, y: CGRectGetMidY(self.frame) + pipeOffset)
            gap.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(pipe1.size.width, gapHeight))
            gap.physicsBody?.categoryBitMask = gapGroup
            gap.runAction(moveAndRemovePipe)
            gap.physicsBody!.dynamic = false
            gap.physicsBody?.collisionBitMask = gapGroup
            gap.physicsBody?.contactTestBitMask = birdGroup
            
            movingObjects.addChild(gap)
        }}
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        if gameOver != 1 {bird.physicsBody!.velocity = CGVectorMake(0, 0)
            bird.physicsBody!.applyImpulse(CGVectorMake(0, 50))
        } else {
            
            score = 0
            scoreLabel.text = "0"
            movingObjects.removeAllChildren()
            makeBackground()
            labelHolder.removeAllChildren()
            bird.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
            bird.physicsBody?.velocity = CGVectorMake(0, 0)
            bird.physicsBody?.applyImpulse(CGVectorMake(0, 50))
            gameOver = 0
            movingObjects.speed = 1
        }
            }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        println("contact made")
        if contact.bodyA.categoryBitMask ==  gapGroup || contact.bodyB.categoryBitMask == gapGroup{
            score++
            scoreLabel.text = "\(score)"
        } else {
            if gameOver == 0 {
        gameOver = 1
        movingObjects.speed = 0
gameOverLabel.fontName = "Helvetica"
        gameOverLabel.fontSize = 30
        gameOverLabel.text = "Game Over! Tap to play again."
        gameOverLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
                labelHolder.addChild(gameOverLabel)}}
    }
}
