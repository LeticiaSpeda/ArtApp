import Foundation

protocol WalletViewModeling {
    func fetch(_ type: Typefeatch)
}

final class WalletViewModel: WalletViewModeling {

    private let service: WalletServing

    init(service: WalletServing) {
        self.service = service   
    }

    func fetch(_ type: Typefeatch) {
        switch type {
        case .mock:
            service.getWalletFromJson { result, failure in
                print(result)
            }
        case .request:
            service.getWallet { result, failure in
                print(result)
            }
        }
    }
}
