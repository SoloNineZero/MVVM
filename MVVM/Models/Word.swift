import Foundation

struct WordData: Codable {
    let data: [Word]
}

struct Word: Codable {
    let value: String
    let date: String
    let clarification: String
    let photo: URL
}

