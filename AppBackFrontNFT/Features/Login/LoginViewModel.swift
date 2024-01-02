import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func didTapLoginButton()
    func updateLoginButton(isEnable: Bool)
}

final class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?

    private var email: String = ""
    private var password: String = ""

    func updateEmail(_ email: String) {
        self.email = email
        checkButtonState()
    }

    func updatePassword(_ password: String) {
        self.password = password
        checkButtonState()
    }

    func checkButtonState() {
        let isValidEmail = email.isValidEmail(email: email)
        let isValidPassword = password.isValidPassword(password: password)
        delegate?.updateLoginButton(isEnable: isValidEmail && isValidPassword)
    }

    func handleLoginButtonTap() {
        checkButtonState()
        delegate?.didTapLoginButton()
    }
}


