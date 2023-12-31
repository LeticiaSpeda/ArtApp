import UIKit

final class NftDetailViewController: UIViewController, ViewCode {
    private var nftViewModel: NftDetailViewModeling

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .backgroudColorMain
        table.delegate = self
        table.dataSource = self
        table.register(NftDetailTableViewCell.self, forCellReuseIdentifier: NftDetailTableViewCell.identifier)
        table.enableViewCode()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    init(nftViewModel: NftDetailViewModeling) {
        self.nftViewModel = nftViewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    func setupHierarchy() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension NftDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nftViewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NftDetailTableViewCell.identifier, for: indexPath) as? NftDetailTableViewCell
        
        cell?.setupCell(urlImage: nftViewModel.nftImage, delegate: self)

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
}

extension NftDetailViewController: NftDetailTableViewCellDelegate {
    func tappedCloseButton() {
        dismiss(animated: true)
    }
    
    func tappedMagnifyingGlassButton() {
        print("ok")
    }
}
