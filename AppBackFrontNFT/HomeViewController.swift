import UIKit

final class HomeViewController: UIViewController, ViewCode {

    private lazy var mainVStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 14
        stack.enableViewCode()
        return stack
    }()

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.logo)
        imageView.contentMode = .scaleAspectFit
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.layer.cornerRadius = 10
        search.clipsToBounds = true
        search.searchTextField.backgroundColor = .white.withAlphaComponent(0.6)
        search.searchTextField.tintColor = .black
        search.searchTextField.textColor = .black
        search.searchTextField.attributedPlaceholder = NSAttributedString(string: "Pesquise pelo nome", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        search.searchTextField.leftView?.tintColor = .black
        return search
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }

    func setupHierarchy() {
        view.addSubview(mainVStack)

        mainVStack.addArrangedSubview(logoImageView)
        mainVStack.addArrangedSubview(searchBar)
        mainVStack.addArrangedSubview(UIView())

    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainVStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainVStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            mainVStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            mainVStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            logoImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func setupStyle() {
        view.backgroundColor = UIColor(red: 24/255, green: 26/255, blue: 1/255, alpha: 1.0)
    }
}
