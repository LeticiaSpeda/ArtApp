import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
    }
    
    private func setupBar() {
        let home = HomeViewController(viewModel: HomeViewModel(service: HomeService(), nftData: NFTData(), searchNftData: NFTData()))
        home.tabBarItem.image = UIImage(systemName: "house.fill")
        tabBar.tintColor = .white
        tabBar.backgroundColor = .black.withAlphaComponent(0.8)
        
        setViewControllers([home], animated: true)
    }
}
