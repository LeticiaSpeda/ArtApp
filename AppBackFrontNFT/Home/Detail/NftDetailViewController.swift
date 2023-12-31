import UIKit

enum NftDetail: Int {
    case nftImage = 0
    case description = 1
}

final class NftDetailViewController: UIViewController, ViewCode {
    private var viewModel: NftDetailViewModeling

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .backgroudColorMain
        table.delegate = self
        table.dataSource = self
        table.register(NftDetailTableViewCell.self, forCellReuseIdentifier: NftDetailTableViewCell.identifier)
        table.register(NftDescriptionTableViewCell.self, forCellReuseIdentifier: NftDescriptionTableViewCell.identifier)
        table.enableViewCode()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    init(nftViewModel: NftDetailViewModeling) {
        self.viewModel = nftViewModel
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
        return viewModel.numberOfRowsInSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch NftDetail(rawValue: indexPath.row) {
        case .nftImage:

            let cell = tableView.dequeueReusableCell(withIdentifier: NftDetailTableViewCell.identifier, for: indexPath) as? NftDetailTableViewCell
            cell?.setupCell(urlImage: viewModel.nftImage, delegate: self)
            return cell ?? UITableViewCell()
        case .description:

            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell
            cell?.setupCell(id: viewModel.idNft, title: viewModel.nftTitleLabel, description: viewModel.nftdescription)
            return cell ?? UITableViewCell()

        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
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
