import Foundation

protocol HomeViewModeling {
    var service: HomeServiceModeling { get }
    var nftData: NFTData { get }
    var delegate: HomeViewModelDelegate? { get set}
    var numberOfItemsSection: Int { get }
    var sizeForItemAt: CGSize { get }
    func fetchRequest(_ typeFetch: Typefeatch)
    func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft
}

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

final class HomeViewModel: HomeViewModeling {
    var service: HomeServiceModeling
    var nftData: NFTData
    var numberOfItemsSection: Int {
        return nftData.filterListNft?.count ?? 0
    }
    var sizeForItemAt: CGSize {
        return CGSize(width: 110, height: 60)
    }

    weak var delegate: HomeViewModelDelegate?

    init(service: HomeServiceModeling, nftData: NFTData) {
        self.service = service
        self.nftData = nftData
    }

    func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        return nftData.filterListNft?[indexPath.row] ?? FilterNft()
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
