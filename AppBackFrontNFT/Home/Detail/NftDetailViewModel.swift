import UIKit

protocol NftDetailViewModeling {
    var nft: Nft { get }
    var numberOfRowsInSection: Int { get }
    var nftImage: String { get }
    var idNft: Int { get }
    var nftTitleLabel: String { get }
    var nftDescription: String { get }

    func heightForRowAt(indexPath: IndexPath, width: CGFloat) -> CGFloat
}

final class NftDetailViewModel: NftDetailViewModeling {
    var nft: Nft

    var numberOfRowsInSection: Int {
        return 2
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

    init(nft: Nft) {
        self.nft = nft
    }

    func heightForRowAt(indexPath: IndexPath, width: CGFloat) -> CGFloat {
        switch NftDetail(rawValue: indexPath.row) {
        case .nftImage:
            return 400
        case .description:
            let totalLabel = nftDescription.height(withConstrainedWidth: width - 40, font: .systemFont(ofSize: 18))
            return 5 + totalLabel + 5 + 30 + 5 + 24 + 10 + 10
        default:
            return 0
        }
    }
}
