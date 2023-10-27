//
//  GameScene.swift
//  xwingSurvivor
//
//  Created by Rodrigo Oliveros & Ricardo Garcia on 26/10/23.
//

import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let none: UInt32 = 0
    static let all: UInt32 = UInt32.max
    static let player: UInt32 = 0b1
    static let enemy2: UInt32 = 0b10
    static let enemy1: UInt32 = 0b11
    static let help: UInt32 = 0b100
    static let blaster: UInt32 = 0b101
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var tieDestroyed = 0
    var shield = 100
    var player: SKSpriteNode!
    var label: SKLabelNode!
    var gameOver: SKLabelNode!
    var life: SKLabelNode!
    
    
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat{
        return CGFloat.random(in: 0.0...1.0)*(max-min)+min
    }
    
    func randomSign() -> Int {
        let signs = [1,-1]
        return signs.randomElement()!
    }
    
    func addTie() {
        let tie = SKSpriteNode(imageNamed: "enemy2")
        let x = random(min: tie.size.width/2 - size.width/2, max: size.width/2 - tie.size.width/2)
        tie.position = CGPoint(x:x, y: size.height + tie.size.height/2)
        tie.zPosition = 0
        
        tie.physicsBody = SKPhysicsBody(rectangleOf: tie.size)
        tie.physicsBody?.isDynamic = true
        tie.physicsBody?.categoryBitMask = PhysicsCategory.enemy2
        tie.physicsBody?.contactTestBitMask = PhysicsCategory.player
        tie.physicsBody?.collisionBitMask = PhysicsCategory.none
        tie.physicsBody?.usesPreciseCollisionDetection = true
        addChild(tie)
        
        if tieDestroyed < 5 {
            let duration = random(min: CGFloat(4.0), max: CGFloat(6.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            tie.run(SKAction.sequence([move, moveDone]))
        } else if tieDestroyed < 10 {
            let duration = random(min: CGFloat(3.0), max: CGFloat(5.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            tie.run(SKAction.sequence([move, moveDone]))
        } else {
            let duration = random(min: CGFloat(2.0), max: CGFloat(3.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            tie.run(SKAction.sequence([move, moveDone]))
        }
    }
    
    func addShip() {
        
        let ship = SKSpriteNode(imageNamed: "enemy1")
        let x = random(min: ship.size.width/2 - size.width/2, max: size.width/2 - ship.size.width/2)
        ship.position = CGPoint(x:x, y: size.height + ship.size.height/2)
        ship.zPosition = 0
        
        ship.physicsBody = SKPhysicsBody(rectangleOf: ship.size)
        ship.physicsBody?.isDynamic = true
        ship.physicsBody?.categoryBitMask = PhysicsCategory.enemy1
        ship.physicsBody?.contactTestBitMask = PhysicsCategory.player
        ship.physicsBody?.collisionBitMask = PhysicsCategory.none
        ship.physicsBody?.usesPreciseCollisionDetection = true
        addChild(ship)
        
        if tieDestroyed < 5 {
            let duration = random(min: CGFloat(4.0), max: CGFloat(6.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            ship.run(SKAction.sequence([move, moveDone]))
        } else if tieDestroyed < 10 {
            let duration = random(min: CGFloat(3.0), max: CGFloat(5.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            ship.run(SKAction.sequence([move, moveDone]))
        } else {
            let duration = random(min: CGFloat(1.0), max: CGFloat(3.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            ship.run(SKAction.sequence([move, moveDone]))
        }
        
    }
    
    func addR2(){
        
        let r2 = SKSpriteNode(imageNamed: "r2")
        let x = random(min: r2.size.width/2 - size.width/2, max: size.width/2 - r2.size.width/2)
        r2.position = CGPoint(x:x, y: size.height + r2.size.height/2)
        r2.zPosition = 0
        
        r2.physicsBody = SKPhysicsBody(rectangleOf: r2.size)
        r2.physicsBody?.isDynamic = true
        r2.physicsBody?.categoryBitMask = PhysicsCategory.help
        r2.physicsBody?.contactTestBitMask = PhysicsCategory.player
        r2.physicsBody?.collisionBitMask = PhysicsCategory.none
        r2.physicsBody?.usesPreciseCollisionDetection = true
        addChild(r2)
        
        
        
        if tieDestroyed < 15 {
            let duration = random(min: CGFloat(4.0), max: CGFloat(6.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            r2.run(SKAction.sequence([move, moveDone]))
        } else if tieDestroyed < 30 {
            let duration = random(min: CGFloat(2.0), max: CGFloat(4.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            r2.run(SKAction.sequence([move, moveDone]))
        } else {
            let duration = random(min: CGFloat(2.0), max: CGFloat(4.0))
            let move = SKAction.move(to: CGPoint(x: x, y: -size.height/2), duration: TimeInterval(duration))
            let moveDone = SKAction.removeFromParent()
            r2.run(SKAction.sequence([move, moveDone]))
        }
    
    }
    
    func startGame() {
        tieDestroyed = 0
        shield = 100
        label.text = "Destroyed Tie Fighters: " + String(tieDestroyed)
        life.text = "Ship's Shield: " + String(shield) + "%"
        gameOver.isHidden = true
        player.isHidden = false
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addTie), SKAction.wait(forDuration: 5.0)])))
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addShip), SKAction.wait(forDuration: 2.0)])))
        run(SKAction.repeatForever(SKAction.sequence([SKAction.run(addR2), SKAction.wait(forDuration: 10.0)])))
    }
    
    func endGame() {
        if shield == 0 {
            gameOver.isHidden = false
            player.isHidden = true
            removeAllActions()
        }
    }
    
    func explosion() {
            let imagenDeColision = SKSpriteNode(imageNamed: "ex")
            
        imagenDeColision.position = player.position
            
            addChild(imagenDeColision)
            
            let quitarImagenAction = SKAction.sequence([
                SKAction.wait(forDuration: 0.1),
                SKAction.removeFromParent()
            ])
            
            imagenDeColision.run(quitarImagenAction)
        }
    
    func spaceshipCollideWithTie(player: SKSpriteNode, enemy2: SKSpriteNode){
        tieDestroyed += 1
        label.text = "Destroyed Tie Fighters: " + String(tieDestroyed)
        explosion()
        enemy2.removeFromParent()
    }
    
    func spaceshipCollideWithShip(player: SKSpriteNode, enemy1: SKSpriteNode){
        enemy1.removeFromParent()
        shield -= 10
        life.text = "Ship's Shield: " + String(shield) + "%"
        run(SKAction.playSoundFileNamed("grito.mp3", waitForCompletion: false))
        endGame()
    }
    
    func spaceshipCollideWithR2(player: SKSpriteNode, help: SKSpriteNode){
        help.removeFromParent()
        shield += 10
        if shield < 100 {
            life.text = "Ship's Shield: " + String(shield) + "%"
        } else {
            shield = 100
            life.text = "Ship's Shield: 100%"
        }
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.enemy2 {
            spaceshipCollideWithTie(player: contact.bodyA.node as! SKSpriteNode, enemy2: contact.bodyB.node as! SKSpriteNode)
        }
        
        if contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.enemy1 {
            spaceshipCollideWithShip(player: contact.bodyA.node as! SKSpriteNode, enemy1: contact.bodyB.node as! SKSpriteNode)
        }
        
        if contact.bodyA.categoryBitMask == PhysicsCategory.player && contact.bodyB.categoryBitMask == PhysicsCategory.help {
            spaceshipCollideWithR2(player: contact.bodyA.node as! SKSpriteNode, help: contact.bodyB.node as! SKSpriteNode)
        }
    }
    
    override func didMove(to view: SKView) {
        player = (self.childNode(withName: "//player") as! SKSpriteNode)
        player.zPosition = 0
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody?.isDynamic = true
        player.physicsBody?.categoryBitMask = PhysicsCategory.player
        player.physicsBody?.contactTestBitMask = PhysicsCategory.enemy2
        player.physicsBody?.collisionBitMask = PhysicsCategory.none
        player.physicsBody?.usesPreciseCollisionDetection = true
        
        label = (self.childNode(withName: "//label") as! SKLabelNode)
        gameOver = (self.childNode(withName: "//gameOver") as! SKLabelNode)
        life = (self.childNode(withName: "//life") as! SKLabelNode)
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
        
        let backgroundMusic = SKAudioNode(fileNamed: "battle.mp3")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
        
        startGame()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        if !gameOver.isHidden && gameOver.contains(touch.location(in: self)){
            startGame()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            if self.player != nil {
                player!.position = t.location(in: self)
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
      
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    
}
