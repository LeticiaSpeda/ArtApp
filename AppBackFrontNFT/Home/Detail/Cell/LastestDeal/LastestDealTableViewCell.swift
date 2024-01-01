import UIKit

final class LastestDealTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: LastestDealTableViewCell.self)

    var viewModel: LastestDealTableViewCellViewModeling? = LastestDealTableViewCellViewModel()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.enableViewCode()
        return label
    }()

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.isScrollEnabled = false
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        table.register(ListOffersTableViewCell.self, forCellReuseIdentifier: ListOffersTableViewCell.identifier)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 100
        table.enableViewCode()
        return table
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupCell(data: Nft) {
        viewModel?.setNft(nft: data)
        titleLabel.text = viewModel?.title
        tableView.reloadData()
    }

    func setupHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }

    func setupStyle() {
        backgroundColor = .backgroudColorMain
        selectionStyle = .none
    }
}

extension LastestDealTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListOffersTableViewCell.identifier, for: indexPath) as? ListOffersTableViewCell else {
            fatalError("Could not dequeue ListOffersTableViewCell")
        }

        if let data = viewModel?.loadCurrentLatestDeal(indexPath: indexPath) {
            cell.setupCell(data: data, isInicial: viewModel?.isInicial(indexPath: indexPath) ?? false, isFinal: viewModel?.isFinal(indexPath: indexPath) ?? false)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel?.heightForRowAt ?? UITableView.automaticDimension
    }
}
