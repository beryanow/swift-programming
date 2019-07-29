import Foundation

func makeUpNumbers() -> (Int, Int) {
    var a = Int(arc4random_uniform(100))
    var b = Int(arc4random_uniform(100))
    return (a, b)
}
