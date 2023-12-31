import UIKit

protocol NftDetailViewModeling {
    var nft: Nft { get }
    var numberOfRowsInSection: Int { get }
    var nftImage: String { get }
}

final class NftDetailViewModel: NftDetailViewModeling {
    var nft: Nft

    var numberOfRowsInSection: Int {
        return 1
    }

    var nftImage: String {
        return nft.nftImage ?? ""
    }

    init(nft: Nft) {
        self.nft = nft
    }
}
