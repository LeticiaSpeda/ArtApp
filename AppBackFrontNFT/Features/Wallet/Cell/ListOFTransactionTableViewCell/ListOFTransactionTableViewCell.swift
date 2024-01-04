import UIKit

final class ListOFTransactionTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: ListOFTransactionTableViewCell.self)

    private lazy var idTransactionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.enableViewCode()
        return label
    }()

    private lazy var transactionImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var priceEthLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.enableViewCode()
        return label
    }()

    private lazy var valueInDollarLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.enableViewCode()
        return label
    }()

    private lazy var dateEndHourLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 12)
        label.enableViewCode()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupCell(data: ListOfTransaction, isInicial: Bool, isFinal: Bool) {
        idTransactionLabel.text = data.idTransaction
        transactionImageView.image = UIImage(named: data.image)
        valueInDollarLabel.text = "$\(data.valueDollar)"
        dateEndHourLabel.text = data.dateAndHour

        if data.type == "exit" {
            priceEthLabel.text = "-\(data.priceEth) ETH"
            priceEthLabel.textColor = .backgroundLightDarkBlue

            valueInDollarLabel.textColor = .backgroundLightBlue
            dateEndHourLabel.textColor = .backgroundLightBlue
        } else {
            priceEthLabel.text = "+\(data.priceEth) ETH"
            priceEthLabel.textColor = .backgroundDarkPink

            valueInDollarLabel.textColor = .backgroudLightPink
            dateEndHourLabel.textColor = .backgroudLightPink
        }

        if isInicial {
            roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        }

        if isFinal {
            roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    }

    func setupHierarchy() {
        addSubview(idTransactionLabel)
        addSubview(transactionImageView)
        addSubview(priceEthLabel)
        addSubview(valueInDollarLabel)
        addSubview(dateEndHourLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            transactionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            transactionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            transactionImageView.heightAnchor.constraint(equalToConstant: 20),
            transactionImageView.widthAnchor.constraint(equalToConstant: 20),

            idTransactionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            idTransactionLabel.leadingAnchor.constraint(equalTo: transactionImageView.trailingAnchor, constant: 10),

            dateEndHourLabel.topAnchor.constraint(equalTo: idTransactionLabel.bottomAnchor, constant: 5),
            dateEndHourLabel.leadingAnchor.constraint(equalTo: idTransactionLabel.trailingAnchor),

            priceEthLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            priceEthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),

            valueInDollarLabel.topAnchor.constraint(equalTo: priceEthLabel.bottomAnchor, constant: 5),
            valueInDollarLabel.trailingAnchor.constraint(equalTo: priceEthLabel.trailingAnchor)
        ])
    }
}
