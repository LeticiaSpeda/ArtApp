import UIKit

final class ProfileImageTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: ProfileImageTableViewCell.self)

    private lazy var nftImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "nft"))
        image.contentMode = .scaleAspectFill
        image.enableViewCode()
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        clipsToBounds = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupHierarchy() {
        contentView.addSubview(nftImageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            nftImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nftImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 300)
        ])
    }
}
