import Foundation

final class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MainCellViewModel]> = Observable(nil)
    var dataSource: [Word]?
    
    func numbersInRows(_ section: Int) -> Int {
        dataSource?.count ?? 0
    }
    
    func getUsers() {
        isLoading.value = true
        
        NetworkDataFetch.shared.fetchWords { [weak self] wordData, error in
            guard let self else { return }
            self.isLoading.value = false
            if let wordData {
                self.dataSource = wordData.data.reversed()
                mapCellData()
            }
        }
    }
    
    func mapCellData() {
        cellDataSource.value = dataSource?.compactMap({ MainCellViewModel($0) })
    }
}
