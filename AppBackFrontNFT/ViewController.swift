import UIKit

final class ViewController: UIViewController, ViewCode {

    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.enableViewCode()
        return stack
    }()

    private lazy var imageBottom: UIImageView = {
        let image = UIImageView(image: UIImage.gradient)
        image.contentMode = .scaleAspectFit
        image.enableViewCode()
        return image
    }()

    private lazy var imageLogo: UIImageView = {
        let image = UIImageView(image: UIImage.logo)
        image.contentMode = .scaleAspectFit
        image.enableViewCode()
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    func setupHierarchy() {
        view.addSubview(imageBottom)

        imageBottom.addSubview(verticalStackView)

        verticalStackView.addArrangedSubview(imageLogo)
        verticalStackView.addArrangedSubview(UIView())
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            setupVerticalStackConstraints() +
            setupImageBottomContraints() +
            setupImageLogoConstraints()
        )
    }

    private func setupVerticalStackConstraints() -> [NSLayoutConstraint] {
        [ verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
          verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
          verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
          verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
    }

    private func setupImageBottomContraints() -> [NSLayoutConstraint] {
        [imageBottom.topAnchor.constraint(equalTo: view.topAnchor),
         imageBottom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         imageBottom.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         imageBottom.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ]
    }

    private func setupImageLogoConstraints() -> [NSLayoutConstraint] {
        [imageLogo.heightAnchor.constraint(equalToConstant: 80)]
    }
}


