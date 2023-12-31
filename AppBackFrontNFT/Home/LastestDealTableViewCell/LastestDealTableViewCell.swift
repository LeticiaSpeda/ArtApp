import UIKit

final class LastestDealTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: LastestDealTableViewCell.self)

    private var viewModel: LastestDealTableViewCellViewModeling

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
        table.enableViewCode()
        return table
    }()

    init(style: UITableViewCell.CellStyle, reuseIdentifier: String?, viewModel: LastestDealTableViewCellViewModeling) {
        self.viewModel = viewModel
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupCell(data: Nft) {
        viewModel.setNft(nft: data)
        titleLabel.text = viewModel.title

    }

    func setupHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
}


extension LastestDealTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }

}
