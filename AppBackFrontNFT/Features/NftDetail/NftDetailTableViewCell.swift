import UIKit
import AlamofireImage

protocol NftDetailTableViewCellDelegate: AnyObject {
    func tappedCloseButton()
    func tappedMagnifyingGlassButton()
}

final class NftDetailTableViewCell: UITableViewCell, ViewCode {

    static let identifier = String(describing: NftDetailTableViewCell.self)

    private weak var delegate: NftDetailTableViewCellDelegate?

    private lazy var nftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleToFill
        imageView.isUserInteractionEnabled = false
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var closedButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.backgroundColor = .backgroundColorButtonCell
        button.tintColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.enableViewCode()
        return button
    }()

    private lazy var magnifyingGlassButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = .backgroundColorButtonCell
        button.tintColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.enableViewCode()
        return button
    }()

    @objc func tappedClosedButton() {
        delegate?.tappedCloseButton()
    }

    @objc func tappedmagnifyingGlassButton() {
        delegate?.tappedMagnifyingGlassButton()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func setupActions() {
        closedButton.addTarget(self, action: #selector(tappedClosedButton), for: .touchUpInside)
        magnifyingGlassButton.addTarget(self, action: #selector(tappedmagnifyingGlassButton), for: .touchUpInside)
    }

    func setupCell(urlImage: String, delegate: NftDetailTableViewCellDelegate) {
        if let url = URL(string: urlImage) {
            nftImageView.af.setImage(withURL: url)
        }
        self.delegate = delegate
    }

    func setupHierarchy() {
        contentView.addSubview(nftImageView)
        contentView.addSubview(closedButton)
        contentView.addSubview(magnifyingGlassButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            closedButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            closedButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            closedButton.heightAnchor.constraint(equalToConstant: 35),
            closedButton.widthAnchor.constraint(equalToConstant: 35),

            magnifyingGlassButton.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            magnifyingGlassButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            magnifyingGlassButton.heightAnchor.constraint(equalToConstant: 35),
            magnifyingGlassButton.widthAnchor.constraint(equalToConstant: 35)
        ])
    }
}
