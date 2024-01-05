import UIKit

protocol ProfileTableViewCellDelegate: AnyObject {
    func tappedCloseButton()
}

final class ProfileTableViewCell: UITableViewCell, ViewCode {
    static let identifier = String(describing: ProfileTableViewCell.self)

    weak var delegate: ProfileTableViewCellDelegate?

    private lazy var userImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "user"))
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 65
        image.layer.borderWidth = 2
        image.layer.borderColor = UIColor.white.cgColor
        image.enableViewCode()
        return image
    }()

    private lazy var editImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "pencil"))
        image.tintColor = .white
        image.contentMode = .scaleAspectFill
        image.enableViewCode()
        return image
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sair do App", for: .normal)
        button.setTitleColor(UIColor.backgroundPink, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.layer.borderColor = UIColor.backgroundPink.cgColor
        button.layer.borderWidth = 1.7
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.enableViewCode()
        return button
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Leticia"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        label.textAlignment = .right
        label.enableViewCode()
        return label
    }()

    private lazy var profileAtLabel: UILabel = {
        let label = UILabel()
        label.text = "@User_Leticia"
        label.textColor = .backgroudLightPink
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .right
        label.enableViewCode()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
        clipsToBounds = true
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    @objc func tappedCloseButton() {
        delegate?.tappedCloseButton()
    }

    func setupCell(delegate: ProfileTableViewCellDelegate) {
        self.delegate = delegate
    }

    func setupActions() {
        closeButton.addTarget(self, action: #selector(tappedCloseButton), for: .touchUpInside)
    }

    func setupHierarchy() {
        contentView.addSubview(userImageView)
        contentView.addSubview(editImageView)
        contentView.addSubview(closeButton)
        contentView.addSubview(nameLabel)
        contentView.addSubview(profileAtLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 130),
            userImageView.widthAnchor.constraint(equalToConstant: 130),

            editImageView.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            editImageView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: -25),
            editImageView.heightAnchor.constraint(equalToConstant: 25),
            editImageView.widthAnchor.constraint(equalToConstant: 25),

            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            profileAtLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            profileAtLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),

            closeButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 60),
            closeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 130 + 25 + 40 + 20 + 60 + 20),

        ])
    }

    func setupStyle() {
        backgroundColor = .backgroudDarkGray
        selectionStyle = .none
    }
}
