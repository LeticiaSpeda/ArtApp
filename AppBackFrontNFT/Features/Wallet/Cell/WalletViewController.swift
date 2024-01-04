import UIKit

final class WalletViewController: UIViewController, ViewCode {
    var viewModel: WalletViewModeling

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.backgroundColor = .backgroudDarkGray
        table.register(QuotationEthTableViewCell.self, forCellReuseIdentifier: QuotationEthTableViewCell.identifier)
        table.register(LatestTransactionsTableViewCell.self, forCellReuseIdentifier: LatestTransactionsTableViewCell.identifier)
        table.enableViewCode()
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetch(.request)
        commonInit()
    }

    init(viewModel: WalletViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupHierarchy() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension WalletViewController: WalletViewModelDelegate {
    func sucess() {
        DispatchQueue.main.async {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
    }

    func error() {
        print(#function)
    }
}

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            let cell = tableView.dequeueReusableCell(withIdentifier: QuotationEthTableViewCell.identifier, for: indexPath) as? QuotationEthTableViewCell

            cell?.setupCell(data: viewModel.quotationEthreum)

            return cell ?? UITableViewCell()

        case.transactionList:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestTransactionsTableViewCell.identifier, for: indexPath) as? LatestTransactionsTableViewCell
            cell?.viewModel = LatestTransactionsTableViewCellViewModel()
            cell?.viewModel.data = viewModel.walletData?.latestTransactionsCell
            cell?.setupCell(data: viewModel.walletData?.latestTransactionsCell ?? LatestTransactionsCell())

            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }

}
