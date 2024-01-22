import Foundation

final class MainCellViewModel {
    var name: String
    var userName: String
    var email: String
    
    init(_ users: User) {
        self.name = users.name
        self.userName = users.username
        self.email = users.email
    }
}
