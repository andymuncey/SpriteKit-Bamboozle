//
//  GameViewController.swift
//  Bamboozle
//
//  Created by Andrew Muncey on 21/01/2015.
//  Copyright (c) 2015 University of Chester. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size: view.bounds.size) 
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            
            skView.presentScene(scene)
        
        
        
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
}
