import UIKit

class ViewController: UIViewController {
    var fullResult: Int = 0
    @IBOutlet weak var showExpression: UILabel!
    @IBOutlet weak var showAnswer: UILabel!
    @IBOutlet weak var answerState: UILabel!
    
    @IBAction func selectDigit(_ sender: UIButton) {
        let digit = Character(sender.titleLabel!.text!)
        if showAnswer.text! == "..." {
            showAnswer.text! = ""
        }
        if digit == "<" {
            if (!showAnswer.text!.isEmpty) {
                showAnswer.text!.removeLast()
            }
        } else {
            showAnswer.text!.append(digit)
        }
    }
    
    @IBAction func createExpression() {
        var numbers = makeUpNumbers()
        var variant = arc4random_uniform(2)
        var result = 0
        answerState.textColor = UIColor.black
        showExpression.text! = ""
        answerState.text! = "Предполагаемый ответ"
        showAnswer.text! = "..."
        switch variant {
        case 0:
            result = Int(numbers.0 + numbers.1)
            fullResult = result
            showExpression.text! += String(numbers.0)
            showExpression.text! += " + "
            showExpression.text! += String(numbers.1)
        case 1:
            result = Int(numbers.0 - numbers.1)
            fullResult = result
            showExpression.text! += String(numbers.0)
            showExpression.text! += " - "
            showExpression.text! += String(numbers.1)
        default:
            break
        }
    }
    
    @IBAction func checkResult() {
        let result = Int(showAnswer.text!)
        if result == nil {
            answerState.text! = "Ошибка в записи!"
            answerState.textColor = UIColor.red
            return
        }
        if showExpression.text! == "..." {
            answerState.text! = "Пустое выражение!"
            answerState.textColor = UIColor.red
            return
        }
        if result == fullResult {
            answerState.text! = "Правильный ответ!"
            answerState.textColor = UIColor.init(red: 0.14, green: 0.74, blue: 0.06, alpha: 1)
        } else {
            answerState.text! = "Неправильный ответ!"
             answerState.textColor = UIColor.red
        }
        
    }
    @IBAction func showMessage() -> () {
        let alertController = UIAlertController(title: "Welcome to my App", message: "Max Beryanov", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        alertController.addAction(UIAlertAction(title: "Close", style: UIAlertAction.Style.destructive, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

