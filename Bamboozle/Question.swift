import Foundation

struct Question : Equatable {
    
    init? (_ question: String, answers: [String], correctIndex: Int) {
        if (answers.count == 4 && (0..<4).contains(correctIndex) ){
            self.question = question
            self.answers = answers
            self.correctIndex = correctIndex
        } else {
            return nil
        }
    }
    
    let question : String
    let answers : [String]
    let correctIndex : Int
}


extension Question {
    init? (dict: Dictionary<String, Any>){
        question = dict["Question"] as! String
        answers = dict["Answers"] as! [String]
        correctIndex = dict["Answer"] as! Int
        }
}
