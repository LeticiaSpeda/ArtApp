protocol LoginViewModelDelegate: AnyObject {
    func didTapLoginButton()
}

class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?

    func handleLoginButtonTap() {
        print("ok")
        delegate?.didTapLoginButton()
    }
}
