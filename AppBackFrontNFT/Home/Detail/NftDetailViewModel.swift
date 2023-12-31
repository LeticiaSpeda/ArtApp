import UIKit

protocol NftDetailViewModeling {
    var nft: Nft { get }
    var numberOfRowsInSection: Int { get }
    var nftImage: String { get }
    var idNft: Int { get }
    var nftTitleLabel: String { get }
    var nftdescription: String { get }

    func heightForRowAt(indexPath: IndexPath) -> CGFloat
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

    var nftdescription: String {
        return nft.nftDescription ?? ""
    }

    init(nft: Nft) {
        self.nft = nft
    }

    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch NftDetail(rawValue: indexPath.row) {
        case .nftImage:
            return 400
        case .description:
            return 250
        default:
            return 0
        }
    }
}
