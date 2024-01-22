import Foundation

final class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchWords(response: @escaping (WordData?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let wordData = try JSONDecoder().decode(WordData.self, from: data)
                    response(wordData, nil)
                } catch let jsonError{
                    print("Failed to decode JSON", jsonError)
                }
            case .failure(_):
                response(nil, .canNotParseData)
            }
        }
    }
}
