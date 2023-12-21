import UIKit

final class HomeViewController: UIViewController, ViewCode, UITableViewDelegate {
    
    private var viewModel: HomeViewModeling
    
    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 14
        stack.enableViewCode()
        return stack
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.enableViewCode()
        return imageView
    }()
    
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.layer.cornerRadius = 10
        search.clipsToBounds = true
        search.searchTextField.backgroundColor = .white.withAlphaComponent(0.6)
        search.searchTextField.tintColor = .black
        search.searchTextField.textColor = .black
        search.searchTextField.attributedPlaceholder = NSAttributedString(string: "Pesquise pelo nome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        search.searchTextField.leftView?.tintColor = .black
        return search
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .backgroudColorMain
        collection.enableViewCode()
        collection.setCollectionViewLayout(layout, animated: false)
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .backgroudColorMain
        tableView.enableViewCode()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchRequest(.mock)
        commonInit()
    }
    
    init(viewModel: HomeViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func setupHierarchy() {
        view.addSubview(mainVStack)
        
        mainVStack.addArrangedSubview(logoImageView)
        mainVStack.addArrangedSubview(searchBar)
        mainVStack.addArrangedSubview(collectionView)
        mainVStack.addArrangedSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainVStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mainVStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            mainVStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            logoImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupStyle() {
        view.backgroundColor = .backgroudColorMain
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func success() {
        print("FOI SUCESSO")
    }
    
    func error() {
        print("FOI FALHA")
    }

}


extension HomeViewController: UITabBarDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
}
