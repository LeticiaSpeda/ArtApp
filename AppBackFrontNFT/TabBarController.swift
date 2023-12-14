import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBar()
    }

    private func setupBar() {
        let home = HomeViewController()
        home.tabBarItem.image = UIImage(systemName: "house.fill")
        tabBar.tintColor = .white
        tabBar.backgroundColor = .gray

        setViewControllers([home], animated: true)
    }
}
