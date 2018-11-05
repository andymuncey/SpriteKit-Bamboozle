import SpriteKit

class GameScene: SKScene {
    
    var q: Question!
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    private var rightAnswerLabel : SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        if q == nil {
            q = QuestionManager.shared.firstQuestion()
        }
        
        backgroundColor = SKColor.black
        
        //create a label node for the question
        let questionLabel = SKLabelNode(text: q?.question)
        questionLabel.fontName = "Menlo"
        questionLabel.position = CGPoint(x:frame.midX, y:frame.maxY-65)
        addChild(questionLabel)
        
        let colours = [SKColor.red, SKColor.yellow, SKColor.green, SKColor.blue]
        
        for (index, answer) in q.answers.enumerated() {
            let answerLabel = SKLabelNode(fontNamed: "Menlo")
            answerLabel.text = answer
            
            var xOffset : CGFloat = 0.0
            var yOffset : CGFloat = 0.0
            if index % 2 == 1 {
                xOffset = frame.width / 2
            }
            if  index / 2 == 0 {
                yOffset = 100
            }
            
            let x = frame.width / 4 + xOffset
            let y = 100 + yOffset
            answerLabel.position = CGPoint(x:x, y:y)
            answerLabel.fontColor = colours[index]
            addChild(answerLabel)
            
            if q.correctIndex == index {
                rightAnswerLabel = answerLabel
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch :UITouch = touches.first!
        
        let touchLocation = touch.location(in: self)
        
        if  rightAnswerLabel.contains(touchLocation){
            if QuestionManager.shared.hasNextQuestion() {
                let nextQ = QuestionManager.shared.nextQuestion()!
                goToSceneWithQuestion(q: nextQ)
            } else {
                print("Game complete")
            }
        }
        else
        {
            //back to the start
            goToSceneWithQuestion(q: QuestionManager.shared.firstQuestion())
        }
    }
    
    func goToSceneWithQuestion(q: Question){
        let nextQuestionScene = GameScene(size:size)
        nextQuestionScene.q = q
        let fade = SKTransition.fade(withDuration: 0.5)
        view?.presentScene(nextQuestionScene, transition: fade)
    }
}
