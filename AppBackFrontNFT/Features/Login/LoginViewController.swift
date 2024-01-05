import UIKit
import Loady
import FirebaseAuth

final class LoginViewController: UIViewController, ViewCode {
    private let viewModel = LoginViewModel()
    private var auth: Auth?

    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.enableViewCode()
        return stack
    }()

    private lazy var imageLogo: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.enableViewCode()
        return stack
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


    private lazy var recoverPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Recuperar senha?", for: .normal)
        button.titleLabel?.textColor = UIColor.systemPink
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.enableViewCode()
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.textColor = UIColor.systemPink
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 8
        button.enableViewCode()
        return button
    }()

    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.color = .white
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        auth = Auth.auth()
        dismissKeyBoard()
        commonInit()
    }

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

    func setButtonGradientBackground() {
        let colorTop =  UIColor(
            red: 234.0/255.0,
            green: 71.0/255.0,
            blue: 234.0/255.0,
            alpha: 1.0
        ).cgColor

        let colorBottom = UIColor(
            red: 160.0/255.0,
            green: 58.0/255.0,
            blue: 239.0/255.0,
            alpha: 1.0
        ).cgColor

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [1.0, 0.0]
        gradientLayer.frame = self.view.bounds

        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

    @objc func handleLogin() {
        viewModel.handleLoginButtonTap()
    }

    func setupActions() {
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }

    func setupHierarchy() {
        view.addSubview(verticalStackView)

        verticalStackView.addArrangedSubview(UIView())
        verticalStackView.addArrangedSubview(imageLogo)
        verticalStackView.addArrangedSubview(titleApp)
        verticalStackView.addArrangedSubview(subTitleApp)
        verticalStackView.addArrangedSubview(emailTextField)
        verticalStackView.addArrangedSubview(passworTextField)
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(loginButton)
        verticalStackView.addArrangedSubview(UIView())

        loginButton.addSubview(activityIndicator)

        horizontalStackView.addArrangedSubview(UIView())
        horizontalStackView.addArrangedSubview(recoverPasswordButton)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            setupVerticalStackConstraints() +
            setupImageLogoConstraints() +
            setupEmailTextFieldConstraints() +
            setupPasswordTextFieldConstraints() +
            setupLoaderConstraints()
            )
    }

    private func setupVerticalStackConstraints() -> [NSLayoutConstraint] {
        [verticalStackView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 16
        ),
         verticalStackView.leadingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.leadingAnchor,
            constant: 16
         ),
         verticalStackView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -16
         ),
         verticalStackView.bottomAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.bottomAnchor
         )
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

    private func setupLoaderConstraints() -> [NSLayoutConstraint] {
        [activityIndicator.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
         activityIndicator.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor)]
    }

    func setupStyle() {
        setGradientBackground()
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.red.cgColor
        } else {
            switch textField {
            case emailTextField:
                if let email = emailTextField.text, !email.isValidEmail(email: email) {
                    textField.layer.borderWidth = 2
                    textField.layer.borderColor = UIColor.red.cgColor
                } else {
                    textField.layer.borderWidth = 2
                    textField.layer.borderColor = UIColor.white.cgColor
                }
                viewModel.updateEmail(emailTextField.text ?? "")
            case passworTextField:
                if let password = passworTextField.text, !password.isValidPassword(password: password) {
                    textField.layer.borderWidth = 2
                    textField.layer.borderColor = UIColor.red.cgColor
                } else {
                    textField.layer.borderWidth = 2
                    textField.layer.borderColor = UIColor.white.cgColor
                }
                viewModel.updatePassword(passworTextField.text ?? "")
            default:
                break
            }
        }
    }

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

extension LoginViewController: LoginViewModelDelegate {
    func didTapLoginButton() {
        loginButton.setTitle("", for: .normal)

        loginButton.isEnabled = false

        activityIndicator.startAnimating()

        auth?.signIn(withEmail: emailTextField.text ?? "", password: passworTextField.text ?? "", completion: { user, error in

            self.activityIndicator.stopAnimating()
            self.loginButton.setTitle("Logar", for: .normal)
            self.loginButton.isEnabled = true

            if let error = error {
                let alert = UIAlertController(title: "Não foi possível logar", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
                self.present(alert, animated: true)
            } else {
                let controller = TabBarController()
                controller.modalPresentationStyle = .fullScreen
                self.navigationController?.setViewControllers([controller], animated: true)
            }
        })
    }

    func updateLoginButton(isEnable: Bool) {
        loginButton.isEnabled = isEnable
        loginButton.backgroundColor = isEnable ? .backgroundPink : .gray
    }
}
