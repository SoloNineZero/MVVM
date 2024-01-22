import Foundation

final class DetailsViewModel {
    
    let value: String
    let image: URL
    let description: String
    
    
    init(word: Word) {
        self.value = word.value
        self.image = word.photo
        self.description = word.clarification
    }
}
