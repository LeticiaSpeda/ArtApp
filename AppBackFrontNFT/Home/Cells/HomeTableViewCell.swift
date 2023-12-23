import UIKit
import AlamofireImage

final class HomeTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: HomeTableViewCell.self)

    private lazy var mainHorizontalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.enableViewCode()
        return stack
    }()

    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.4)
        view.enableViewCode()
        return view
    }()

    private lazy var nftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 18
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 24
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var ownerByPrice: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLabel
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.backgroundColor = .backgroundLabel
        label.enableViewCode()
        return label
    }()

    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.backgroundColor = .backgroundLabel
        label.enableViewCode()
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLabel
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.textAlignment = .center
        label.enableViewCode()
        return label
    }()

    private lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.enableViewCode()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }



}

extension HomeTableViewCell {
    func setupHierarchy() {
        addSubview(nftImageView)

    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                nftImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

            ]
        )
    }

    func setupStyle() {
        backgroundColor = .backgroudColorMain
        layer.cornerRadius = 18
        clipsToBounds = true
        
    }
}

extension HomeTableViewCell {
    func setupCell(data: Nft) {

        if let urlNFT = URL(string: data.nftImage ?? ""),let urlUser = URL(string: data.userImage ?? "") {

            nftImageView.af.setImage(
                withURL: urlNFT,
                placeholderImage: UIImage(systemName: "photo")?.withTintColor(.black)
            )

            nftImageView.backgroundColor = .white

            userImageView.af.setImage(
                withURL: urlUser,
                placeholderImage: UIImage(systemName: "person.circle.fill")?.withTintColor(.black)
            )

            userImageView.backgroundColor = .white
        }

        priceLabel.text = data.price
        priceValueLabel.text = "\(data.nftPrice ?? 0.0) ETH"
        ownerByPrice.text = data.ownedBy
        userLabel.text = data.userName
    }
}
