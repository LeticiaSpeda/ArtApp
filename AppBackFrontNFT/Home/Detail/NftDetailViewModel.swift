import UIKit

protocol NftDetailViewModeling {
    var nft: Nft { get set }
}

final class NftDetailViewModel: NftDetailViewModeling {
    var nft: Nft

    init(nft: Nft) {
        self.nft = nft
    }
}
