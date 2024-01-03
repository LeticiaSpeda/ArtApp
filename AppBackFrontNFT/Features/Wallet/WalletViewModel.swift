import Foundation

protocol WalletViewModeling {
    var delegate: WalletViewModelDelegate? { get set }
    var walletData: WalletData? { get }
    var numberOfRowsInSection: Int { get }

    func fetch(_ type: Typefeatch)
    func heightForRowAt(indexPath: IndexPath) -> CGFloat
    func loadCurrentQuotationEthreum(indexPath: IndexPath) -> QuotationEthereun
}

protocol WalletViewModelDelegate: AnyObject {
    func sucess()
    func error()
}


enum WalletNameCell: Int {
    case quotationEth = 1
}

final class WalletViewModel: WalletViewModeling {
    var walletData: WalletData?

    private let service: WalletServing

    weak var delegate: WalletViewModelDelegate?

    init(service: WalletServing) {
        self.service = service
    }

    var numberOfRowsInSection: Int {
        return 1
    }

    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            return 250
        default:
            return 0
        }
    }

    func loadCurrentQuotationEthreum(indexPath: IndexPath) -> QuotationEthereun {
        return walletData!.quotationEthereun
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
