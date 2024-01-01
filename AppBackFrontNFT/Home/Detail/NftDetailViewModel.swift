import UIKit

protocol NftDetailViewModeling {
    var nft: Nft { get }
    var numberOfRowsInSection: Int { get }
    var nftImage: String { get }
    var idNft: Int { get }
    var nftTitleLabel: String { get }
    var nftDescription: String { get }
    var getNft: Nft { get }

    func heightForRowAt(indexPath: IndexPath, width: CGFloat) -> CGFloat
}

final class NftDetailViewModel: NftDetailViewModeling {
    var nft: Nft

    var numberOfRowsInSection: Int {
        return 3
    }

    var nftImage: String {
        return nft.nftImage ?? ""
    }

    var idNft: Int {
        return nft.nftID ?? 0
    }

    var nftTitleLabel: String {
        return nft.nftNameImage ?? ""
    }

    var nftDescription: String {
        return nft.nftDescription ?? ""
    }

    var getNft: Nft {
        return nft
    }

    init(nft: Nft) {
        self.nft = nft
    }

    func heightForRowAt(indexPath: IndexPath, width: CGFloat) -> CGFloat {
        switch NftDetail(rawValue: indexPath.row) {
        case .nftImage:
            return 400
        case .description:
            return nftDescription.height(withConstrainedWidth: width - 40, font: .systemFont(ofSize: 18)) + 89
        case .lastestDeal:
            return HeightLastestDeal.heigth.rawValue * CGFloat(nft.latestDeals?.count ?? 0) + 75

        default:
            return 0
        }
    }
}
