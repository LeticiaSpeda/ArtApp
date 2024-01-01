import Foundation

protocol LastestDealTableViewCellViewModeling {
    var nft: Nft? { get }
    var title: String { get }
    var numberOfRowsInSection: Int { get }
    var heightForRowAt: CGFloat { get }

    func setNft(nft: Nft)
    func loadCurrentLatestDeal(indexPath: IndexPath) -> LatestDeal
    func isInicial(indexPath: IndexPath) -> Bool
    func isFinal(indexPath: IndexPath) -> Bool
}

final class LastestDealTableViewCellViewModel: LastestDealTableViewCellViewModeling {
    var nft: Nft? = nil

    var title: String {
        return nft?.titleLatestDeals ?? ""
    }

    var numberOfRowsInSection: Int {
        return nft?.latestDeals?.count ?? 0
    }

    var heightForRowAt: CGFloat {
        return 70
    }

    func setNft(nft: Nft) {
        self.nft = nft
    }

    func loadCurrentLatestDeal(indexPath: IndexPath) -> LatestDeal {
        return nft?.latestDeals?[indexPath.row] ?? LatestDeal()
    }

    func isInicial(indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }

    func isFinal(indexPath: IndexPath) -> Bool {
        return indexPath.row == numberOfRowsInSection - 1
    }
}
