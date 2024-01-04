import UIKit
import AlamofireImage

final class ListOffersTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: ListOffersTableViewCell.self)

    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.tintColor = .lightGray
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var nameUserLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
        label.enableViewCode()
        return label
    }()

    private lazy var nftPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .backgroudLightPink
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.enableViewCode()
        return label
    }()

    private lazy var lastVisualizationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .backgroudLightPink
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.enableViewCode()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupCell(data: LatestDeal, isInicial: Bool, isFinal: Bool) {
        if let url = URL(string: data.userImage ?? "") {
            userImageView.af.setImage(withURL: url, placeholderImage: UIImage(systemName: "pesron.circle.fill")?.withTintColor(.black))
        }
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 0.5
        nameUserLabel.text = data.userName ?? ""
        nftPriceLabel.text = "\(data.nftPrice ?? 0) ETH "
        lastVisualizationLabel.text = data.lastAccess ?? ""

        if isInicial {
            roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        } else if isFinal {
            roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    }

    func setupHierarchy() {
        contentView.addSubview(userImageView)
        contentView.addSubview(nameUserLabel)
        contentView.addSubview(nftPriceLabel)
        contentView.addSubview(lastVisualizationLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            userImageView.heightAnchor.constraint(equalToConstant: 40),
            userImageView.widthAnchor.constraint(equalToConstant: 40),

            nameUserLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameUserLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 12),

            nftPriceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            nftPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),


            lastVisualizationLabel.topAnchor.constraint(equalTo: nftPriceLabel.bottomAnchor, constant: 5),
            lastVisualizationLabel.trailingAnchor.constraint(equalTo: nftPriceLabel.trailingAnchor, constant: -5),
        ])
    }

    func setupStyle() {
        backgroundColor = .backgroudDarkGray
        selectionStyle = .none
    }
}
