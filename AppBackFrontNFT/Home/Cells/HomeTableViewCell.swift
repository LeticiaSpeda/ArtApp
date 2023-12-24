import UIKit
import AlamofireImage

final class HomeTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: HomeTableViewCell.self)

    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.6)
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
        imageView.layer.cornerRadius = 25
        imageView.tintColor = .black
        imageView.enableViewCode()
        return imageView
    }()
    
    private lazy var ownerByPrice: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLabel
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var userLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColorLabel
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()


    private lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var leadingVStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [ownerByPrice, userLabel])
        s.enableViewCode()
        s.axis = .vertical
        return s
    }()

    private lazy var trailingVStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [priceLabel, priceValueLabel])
        s.enableViewCode()
        s.axis = .vertical
        return s
    }()

    private lazy var hStack: UIStackView = {
        let s = UIStackView(arrangedSubviews: [userImageView, leadingVStack, trailingVStack])
        s.enableViewCode()
        s.axis = .horizontal
        s.spacing = 12
        return s
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
        nftImageView.addSubview(mainView)
        mainView.addSubview(hStack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                nftImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

                mainView.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor),
                mainView.leadingAnchor.constraint(equalTo: nftImageView.leadingAnchor),
                mainView.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor),
                mainView.heightAnchor.constraint(equalToConstant: 70),

                hStack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
                hStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
                hStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
                hStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),

                userImageView.widthAnchor.constraint(equalToConstant: 50),
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
