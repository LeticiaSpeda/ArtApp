import Foundation

protocol HomeViewModeling {
    var nftData: NFTData { get }
    var searchNftData: NFTData { get }
    var delegate: HomeViewModelDelegate? { get set }
    var numberOfItemsSection: Int { get }
    var numberOfRowsInSection: Int { get }
    var sizeForItemAt: CGSize { get }
    var heightForRow: CGFloat { get }

    func fetchRequest(_ typeFetch: Typefeatch)
    func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft
    func loadCurrentNft(indexPath: IndexPath) -> Nft
    func filterSearchText( _ text: String)
}

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

final class HomeViewModel: HomeViewModeling {

    private let service: HomeServiceModeling

    var nftData: NFTData
    var searchNftData: NFTData

    var numberOfItemsSection: Int {
        return searchNftData.filterListNft?.count ?? 0
    }

    var numberOfRowsInSection: Int {
        return searchNftData.nftList?.count ?? 0
    }

    var sizeForItemAt: CGSize {
        return CGSize(width: 110, height: 34)
    }

    var heightForRow: CGFloat {
        return 360
    }

    weak var delegate: HomeViewModelDelegate?

    init(service: HomeServiceModeling, nftData: NFTData, searchNftData: NFTData, delegate: HomeViewModelDelegate? = nil) {
        self.service = service
        self.nftData = nftData
        self.searchNftData = searchNftData
        self.delegate = delegate
    }

    func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        return searchNftData.filterListNft?[indexPath.row] ?? FilterNft()
    }

    func loadCurrentNft(indexPath: IndexPath) -> Nft {
        return searchNftData.nftList?[indexPath.row] ?? Nft()
    }

    func filterSearchText( _ text: String) {
        if text.isEmpty {
            searchNftData.nftList = nftData.nftList
        } else {
            searchNftData.nftList = nftData.nftList?.filter({ nft in
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        }
    }

    func fetchRequest(_ typeFetch: Typefeatch) {
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error()
                }
            }

        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error()
                }
            }
        }
    }
}
