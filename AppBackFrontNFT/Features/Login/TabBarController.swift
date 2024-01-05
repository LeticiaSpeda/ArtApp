import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
    }
    
    private func setupBar() {
        let home = HomeViewController(viewModel: HomeViewModel(service: HomeService(), nftData: NFTData(), searchNftData: NFTData()))
        home.tabBarItem.image = UIImage(systemName: "house.fill")

        let wallet = WalletViewController(viewModel: WalletViewModel(service: WalletService()))
        wallet.tabBarItem.image = UIImage(systemName: "wallet.pass.fill")

        let profile = ProfileViewController()
        profile.tabBarItem.image = UIImage(systemName: "person.crop.square.fill")

        tabBar.tintColor = .white
        tabBar.backgroundColor = .black.withAlphaComponent(0.8)

        setViewControllers([home, wallet, profile], animated: true)
    }
}
