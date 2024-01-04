import UIKit

final class QuotationEthTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: QuotationEthTableViewCell.self)

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var viewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundLightDarkGray
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor.backgroundLightMediumDarkGray?.cgColor
        view.enableViewCode()
        return view
    }()

    private lazy var ethValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 40)
        label.enableViewCode()
        return label
    }()

    private lazy var ethValueInDollarsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .backgroudLightPink
        label.font = .boldSystemFont(ofSize: 14)
        label.enableViewCode()
        return label
    }()

    private lazy var cointEthImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.enableViewCode()
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupCell(data: QuotationEthereun) {
        ethValueLabel.text = "\(data.ethValue) ETH"
        ethValueInDollarsLabel.text = "$\(data.valueInDollars)"
        cointEthImageView.image = UIImage(named: data.coinEthImage)
    }

    func setupHierarchy() {
        addSubview(logoImageView)
        addSubview(viewBackground)
        addSubview(cointEthImageView)

        viewBackground.addSubview(ethValueLabel)
        viewBackground.addSubview(ethValueInDollarsLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),

            viewBackground.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            viewBackground.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 20),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: 150),

            ethValueLabel.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 50),
            ethValueLabel.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 15),

            ethValueInDollarsLabel.topAnchor.constraint(equalTo: ethValueLabel.bottomAnchor, constant: 10),
            ethValueInDollarsLabel.leadingAnchor.constraint(equalTo: ethValueLabel.leadingAnchor),

            cointEthImageView.topAnchor.constraint(equalTo: topAnchor, constant: -10),
            cointEthImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            cointEthImageView.heightAnchor.constraint(equalToConstant: 240),
        ])
    }

    func setupStyle() {
        backgroundColor = .backgroudDarkGray
    }
}
