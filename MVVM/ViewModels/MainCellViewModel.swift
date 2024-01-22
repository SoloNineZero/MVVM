import Foundation

final class MainCellViewModel {
    
    var value: String
    var image: URL
    
    init(_ word: Word) {
        self.value = word.value
        self.image = word.photo
    }
}
