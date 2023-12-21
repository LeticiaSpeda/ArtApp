import Foundation

protocol HomeViewModeling {
    var service: HomeServiceModeling { get }
    var nftData: NFTData { get }
    var delegate: HomeViewModelDelegate? { get set}
    func fetchRequest(_ typeFetch: Typefeatch)
}

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

final class HomeViewModel: HomeViewModeling {
    var service: HomeServiceModeling
    var nftData: NFTData
    weak var delegate: HomeViewModelDelegate?

    init(service: HomeServiceModeling, nftData: NFTData) {
        self.service = service
        self.nftData = nftData
    }

    func fetchRequest(_ typeFetch: Typefeatch) {
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error()
                }
            }

        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error()
                }
            }
        }
    }
}
