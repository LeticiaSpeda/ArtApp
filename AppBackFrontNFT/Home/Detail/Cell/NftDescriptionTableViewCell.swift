import UIKit

final class NftDescriptionTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: NftDescriptionTableViewCell.self)

    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = .backgroudColorLabelSecond
        label.font = .boldSystemFont(ofSize: 24)
        label.enableViewCode()
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 30)
        label.enableViewCode()
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.enableViewCode()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupCell(id: Int, title: String, description: String) {
        idLabel.text = "#\(id)"
        titleLabel.text = title
        descriptionLabel.text = description
    }

    func setupHierarchy() {
        contentView.addSubview(idLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            idLabel.heightAnchor.constraint(equalToConstant: 24),

            titleLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: idLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: idLabel.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }

    func setupStyle() {
        backgroundColor = .backgroudColorMain
    }
}
