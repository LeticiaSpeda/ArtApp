import UIKit

final class LatestTransactionsTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: LatestTransactionsTableViewCell.self)

    var viewModel: LatestTransactionsTableViewCellViewModeling? = LatestTransactionsTableViewCellViewModel()

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
        table.enableViewCode()
        return table
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: leadingAnchor, constant: 24),
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
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
