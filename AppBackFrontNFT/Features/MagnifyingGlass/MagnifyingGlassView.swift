import UIKit

protocol MagnifyingGlassDelegate: AnyObject {
    func tappedBackButton()
}

final class MagnifyingGlassView: UIView, ViewCode {

    weak var delegate: MagnifyingGlassDelegate?

    private(set) lazy var nftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .backgroundLightGray
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .backgroundLightGray
        button.tintColor = .white
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        button.enableViewCode()
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }


    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }

    func setupActions() {
        backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
    }

    func setupHierarchy() {
        addSubview(nftImageView)
        addSubview(backButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
}
