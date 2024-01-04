import UIKit

final class LatestTransactionsTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: LatestTransactionsTableViewCell.self)

    private var latestTransactions: [ListOfTransaction] = []

    var viewModel: LatestTransactionsTableViewCellViewModeling = LatestTransactionsTableViewCellViewModel()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.enableViewCode()
        return label
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.isScrollEnabled = false
        table.backgroundColor = .backgroudDarkGray
        table.delegate = self
        table.dataSource = self
        table.register(ListOFTransactionTableViewCell.self, forCellReuseIdentifier: ListOFTransactionTableViewCell.identifier)
        table.enableViewCode()
        return table
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupCell(data: LatestTransactionsCell) {
        titleLabel.text = data.latestTransactionsTitle 
        latestTransactions = data.listOfTransactions
    }

    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }

    func setupStyle() {
        backgroundColor = .backgroudDarkGray
    }
}

extension LatestTransactionsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOFTransactionTableViewCell.identifier, for: indexPath) as? ListOFTransactionTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentLatestDeal(indexPath: indexPath), isInicial: viewModel.isInicial(indexPath: indexPath), isFinal: viewModel.isFinal(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
}
