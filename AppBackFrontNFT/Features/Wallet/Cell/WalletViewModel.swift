import Foundation

protocol WalletViewModeling {
    var delegate: WalletViewModelDelegate? { get set }
    var walletData: WalletData? { get }
    var numberOfRowsInSection: Int { get }
    var quotationEthreum: QuotationEthereun { get }
    var transationList: LatestTransactionsCell { get }

    func fetch(_ type: Typefeatch)
    func heightForRowAt(indexPath: IndexPath) -> CGFloat
}

protocol WalletViewModelDelegate: AnyObject {
    func sucess()
    func error()
}

enum WalletNameCell: Int {
    case quotationEth = 0
    case transactionList = 1
}

final class WalletViewModel: WalletViewModeling {
    var walletData: WalletData?

    private let service: WalletServing

    weak var delegate: WalletViewModelDelegate?

    init(service: WalletServing) {
        self.service = service
    }

    var numberOfRowsInSection: Int {
        return 2
    }

    var quotationEthreum: QuotationEthereun {
        return walletData!.quotationEthereun
    }

    var transationList: LatestTransactionsCell {
        return walletData!.latestTransactionsCell
    }

    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            return 250

        case .transactionList:
            return HeightLatestTransactions.heigth.rawValue * CGFloat(walletData?.latestTransactionsCell.listOfTransactions.count ?? 0) + 75
        default:
            return 0
        }
    }

    func fetch(_ type: Typefeatch) {
        switch type {
        case .mock:
            service.getWalletFromJson { result, failure in
                if let result {
                    self.walletData = result
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error()
                }
            }
        case .request:
            service.getWallet { result, failure in
                if let result {
                    self.walletData = result
                    self.delegate?.sucess()
                } else {
                    self.delegate?.error()
                }
            }
        }
    }
}
