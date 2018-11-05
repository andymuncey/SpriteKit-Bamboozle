//
//  GameScene.swift
//  Bamboozle
//
//  Created by Andrew Muncey on 21/01/2015.
//  Copyright (c) 2015 University of Chester. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    //implictly upwrapped optional (denoted by the ! after SKLabelNode)
    private var rightAnswer : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        //set background color
        backgroundColor = SKColor.black
        
        //create a label node for the question
        let question = SKLabelNode(text: "What is 4 + 2?")
        question.fontName = "Menlo"
        question.position = CGPoint(x:frame.midX, y:frame.maxY-50)
        
        //add the question to the scene
        addChild(question)
        
        
        let answer1 = SKLabelNode(fontNamed: "Menlo")
        answer1.text = "2"
        answer1.position = CGPoint(x:70, y:200)
        answer1.fontColor = SKColor.red
        addChild(answer1)
        
        let answer2 = SKLabelNode(fontNamed: "Menlo")
        answer2.text = "4"
        answer2.position = CGPoint(x:270, y:200)
        answer2.fontColor = SKColor.red
        addChild(answer2)
        
        let answer3 = SKLabelNode(fontNamed: "Menlo")
        answer3.text = "6"
        answer3.position = CGPoint(x:70, y:100)
        answer3.fontColor = SKColor.red
        addChild(answer3)
        
        let answer4 = SKLabelNode(fontNamed: "Menlo")
        answer4.text = "8"
        answer4.position = CGPoint(x:270, y:100)
        answer4.fontColor = SKColor.red
        addChild(answer4)
        
        rightAnswer = answer3;
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch :UITouch = touches.first!
        
        let touchLocation = touch.location(in: self)
        
        if  rightAnswer.contains(touchLocation){
            let q2Scene = Question2(size:size)
            let fade = SKTransition.fade(withDuration: 0.5)
            view?.presentScene(q2Scene, transition: fade)
        }
        else
        {
            //on the first screen we just stay where we are (until the player gets the right answer)
            //for later scenes we will add code here to go right back to the first scene
        }
    }
}
