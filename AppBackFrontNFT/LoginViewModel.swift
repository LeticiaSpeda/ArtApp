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

extension String {
    func isValidEmail(email: String) -> Bool {
       let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
       let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
       return emailPredicate.evaluate(with: email)
   }

    func isValidPassword(password: String) -> Bool {
       return password.count >= 6
   }
}
