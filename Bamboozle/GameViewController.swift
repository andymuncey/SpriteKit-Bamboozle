import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var questions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let skView = self.view as! SKView
        skView.ignoresSiblingOrder = true
        let scene = GameScene(size: view.bounds.size)
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
