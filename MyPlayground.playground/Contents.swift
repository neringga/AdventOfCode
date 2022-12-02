import Foundation

func countMaxCalories() throws -> Int? {
    let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt")
    let content = try String(contentsOf: fileUrl!, encoding: String.Encoding.utf8)
    let separatedContent: [String] = content.components(separatedBy: "\n")
    
    var elvesKcal: [Int] = [0, 0, 0]
    var elfKcal = 0
        
    for item in separatedContent
    {
        guard let kcal = Int(item) else {
            if let lessKcalElfIndex = elvesKcal.firstIndex(where: { $0 < elfKcal}) {
                elvesKcal[lessKcalElfIndex] = elfKcal
                elvesKcal = elvesKcal.sorted()
            }
            
            elfKcal = 0
            continue
        }
        
        elfKcal = elfKcal + kcal
    }

    return elvesKcal.reduce(0, +)
}

print(try countMaxCalories() ?? 0)
