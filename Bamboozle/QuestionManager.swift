import Foundation

class QuestionManager {
    
    static let shared = QuestionManager()
    
    private var questions = [Question] ()
    private var index = 0
    
    private init(){
        let path = Bundle.main.path(forResource: "Questions", ofType: "plist")
        let questionsFromFile = NSArray(contentsOfFile: path!) as! [Dictionary<String, Any>]
        
        for item in questionsFromFile {
            let question = Question(dict: item)
            if question != nil {
                questions.append(question!)
            }
        }
    }
    
    func firstQuestion() -> Question{
        index = 0
        return questions.first!
    }
    
    func hasNextQuestion() -> Bool {
        return index + 1 < questions.count
    }
    
    func nextQuestion() -> Question? {
        index += 1
        if index < questions.count {
            return questions[index]
        }
        return nil
    }
}
