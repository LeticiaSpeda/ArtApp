import UIKit

protocol LatestTransactionsTableViewCellViewModeling {
    var data: LatestTransactionsCell? { get set }
    var title: String { get }
    var numberOfRowsInSection: Int { get }
    var heightForRowAt: CGFloat { get }

    func setLatest(data: LatestTransactionsCell)
    func loadCurrentLatestDeal(indexPath: IndexPath) -> ListOfTransaction
    func isInicial(indexPath: IndexPath) -> Bool
    func isFinal(indexPath: IndexPath) -> Bool
}

enum HeightLatestTransactions: CGFloat {
    case heigth = 70
}

final class LatestTransactionsTableViewCellViewModel: LatestTransactionsTableViewCellViewModeling {

    var data: LatestTransactionsCell? = nil

    var title: String {
        return data?.latestTransactionsTitle ?? ""
    }

    var numberOfRowsInSection: Int {
        return data?.listOfTransactions.count ?? 0
    }

    var heightForRowAt: CGFloat {
        return HeightLatestTransactions.heigth.rawValue
    }

    func setLatest(data: LatestTransactionsCell) {
        self.data = data
    }
    
    func loadCurrentLatestDeal(indexPath: IndexPath) -> ListOfTransaction {
        return data?.listOfTransactions[indexPath.row] ?? ListOfTransaction()
    }

    func isInicial(indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }

    func isFinal(indexPath: IndexPath) -> Bool {
        return indexPath.row == numberOfRowsInSection - 1
    }

}
