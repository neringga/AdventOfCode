import Foundation

enum myErr: Error {
    case runtimeError(String)
}

func countMaxCalories() throws -> Int? {
    let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
    let content = try String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
    let separatedContent: [String] = content.components(separatedBy: "\n")
    
    var elvesKcal = Set<Int>()
    var elfKcal = 0
        
    for item in separatedContent
    {
        guard let kcal = Int(item) else {
            elvesKcal.insert(elfKcal)
            elfKcal = 0
            continue
        }
        
        elfKcal = elfKcal + kcal
    }
    
    return elvesKcal.max()
}

print(try countMaxCalories() ?? 0)
