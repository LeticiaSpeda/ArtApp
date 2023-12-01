import UIKit

final class LoginViewController: UIViewController, ViewCode {

    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.enableViewCode()
        return stack
    }()

    private lazy var imageLogo: UIImageView = {
        let image = UIImageView(image: UIImage.logo)
        image.contentMode = .scaleAspectFit
        image.enableViewCode()
        return image
    }()

    private lazy var titleApp: UILabel = {
        let label = UILabel()
        label.text = "BackFront NFT"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        return label
    }()

    private lazy var subTitleApp: UILabel = {
        let label = UILabel()
        label.text = "O marketplace da NFT da Backfront Academy"
        label.textColor = .white.withAlphaComponent(0.5)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .center
        return label
    }()

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.tintColor = .white
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        textField.keyboardType = .emailAddress
        textField.attributedPlaceholder = NSAttributedString(string: "usuario@email.com", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        textField.leftViewMode = .always
        textField.backgroundColor = .black.withAlphaComponent(0.3)
        textField.keyboardAppearance = .dark
        textField.enablesReturnKeyAutomatically = true
        textField.returnKeyType = .next
        textField.delegate = self
        textField.tag = 1
        textField.enableViewCode()
        return textField
    }()

    private lazy var passworTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.tintColor = .white
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        textField.attributedPlaceholder = NSAttributedString(string: "senha: @hd_135", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.6)])
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 62))
        textField.leftViewMode = .always
        textField.backgroundColor = .black.withAlphaComponent(0.3)
        textField.keyboardAppearance = .dark
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.tag = 2
        textField.enableViewCode()
        return textField
    }()

    func setGradientBackground() {
        let colorTop =  UIColor(
            red: 36.0/255.0,
            green: 36.0/255.0,
            blue: 36.0/255.0,
            alpha: 1.0
        ).cgColor
        let colormiddle = UIColor(
            red: 82.0/255.0,
            green: 04.0/255.0,
            blue: 92.0/255.0,
            alpha: 0.0
        ).cgColor
        let colorBottom = UIColor(
            red: 42.0/255.0,
            green: 41.0/255.0,
            blue: 41.0/255.0,
            alpha: 1.0
        ).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colormiddle, colorBottom]
        gradientLayer.locations = [0.0, 1.0, 0.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    func setupHierarchy() {
        view.addSubview(verticalStackView)

        verticalStackView.addArrangedSubview(UIView())
        verticalStackView.addArrangedSubview(imageLogo)
        verticalStackView.addArrangedSubview(titleApp)
        verticalStackView.addArrangedSubview(subTitleApp)
        verticalStackView.addArrangedSubview(emailTextField)
        verticalStackView.addArrangedSubview(passworTextField)
        verticalStackView.addArrangedSubview(UIView())
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            setupVerticalStackConstraints() +
            setupImageLogoConstraints() +
            setupEmailTextFieldConstraints() +
            setupPasswordTextFieldConstraints()
        )
    }

    private func setupVerticalStackConstraints() -> [NSLayoutConstraint] {
        [ verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
          verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
          verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
          verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ]
    }

    private func setupImageLogoConstraints() -> [NSLayoutConstraint] {
        [imageLogo.heightAnchor.constraint(equalToConstant: 80)]
    }

    private func setupEmailTextFieldConstraints() -> [NSLayoutConstraint] {
        [emailTextField.heightAnchor.constraint(equalToConstant: 40)]
    }

    private func setupPasswordTextFieldConstraints() -> [NSLayoutConstraint] {
        [passworTextField.heightAnchor.constraint(equalToConstant: 40)]
    }

    func setupStyle() {
        setGradientBackground()
    }
}


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1

        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }

        return true
       }
}
