import UIKit

final class HomeTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: HomeTableViewCell.self)

    private lazy var mainVerticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.enableViewCode()
        return stack
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
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupHierarchy() {
        addSubview(mainVerticalStack)

        mainVerticalStack.addArrangedSubview(nftImageView)
        mainVerticalStack.addArrangedSubview(userImageView)
        mainVerticalStack.addArrangedSubview(ownerByPrice)
        mainVerticalStack.addArrangedSubview(userLabel)
        mainVerticalStack.addArrangedSubview(priceLabel)
        mainVerticalStack.addArrangedSubview(priceValueLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            mainVerticalStackConstraints() +
            nftImageViewConstraints() +
            userImageViewConstraints() +
            ownerByPriceConstraints() +
            userLabelConstraints() +
            priceLabelConstraints()
        )
    }

    private func mainVerticalStackConstraints() -> [NSLayoutConstraint] {
        [
        mainVerticalStack.topAnchor.constraint(equalTo: topAnchor, constant: 10),
        mainVerticalStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        mainVerticalStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        mainVerticalStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ]
    }

    private func nftImageViewConstraints() -> [NSLayoutConstraint] {
        [ nftImageView.heightAnchor.constraint(equalToConstant: 270) ]
    }

    private func userImageViewConstraints() -> [NSLayoutConstraint] {
        [
            userImageView.heightAnchor.constraint(equalToConstant: 48),
            userImageView.widthAnchor.constraint(equalToConstant: 48)
        ]
    }

    private func ownerByPriceConstraints() -> [NSLayoutConstraint] {
        [ ownerByPrice.leadingAnchor.constraint(
            equalTo: userImageView.trailingAnchor,
            constant: 8
        )]
    }

    private func userLabelConstraints() -> [NSLayoutConstraint] {
        [ userLabel.leadingAnchor.constraint(
            equalTo: userImageView.trailingAnchor,
            constant: 8
        )]
    }

    private func priceLabelConstraints() -> [NSLayoutConstraint] {
        [ priceLabel.trailingAnchor.constraint(
            equalTo: mainVerticalStack.trailingAnchor,
            constant: -15
        )]
    }

    private func priceValueLabelConstraints() -> [NSLayoutConstraint] {
        [ priceValueLabel.trailingAnchor.constraint(
            equalTo: mainVerticalStack.trailingAnchor,
            constant: -15
        )]
    }

    func setupStyle() {
        backgroundColor = .backgroudColorMain
        layer.cornerRadius = 18
        clipsToBounds = true
    }
}
