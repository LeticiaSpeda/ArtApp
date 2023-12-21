import UIKit

final class HomeCollectionViewCell: UICollectionViewCell, ViewCode {
    static let identifier = String(describing: HomeCollectionViewCell.self)

    private lazy var filterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 14)
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
        label.textAlignment = .center
        label.enableViewCode()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupCell(filter: FilterNft) {
        filterLabel.text = filter.title ?? ""
        if filter.isSelected ?? false {
            filterLabel.backgroundColor = .purple
        } else {
            filterLabel.backgroundColor = .backgroundLabel
        }
    }

    func setupHierarchy() {
        addSubview(filterLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            filterLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            filterLabel.heightAnchor.constraint(equalToConstant: 34),
            filterLabel.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
