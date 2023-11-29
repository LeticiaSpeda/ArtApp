import UIKit

final class ViewController: UIViewController, ViewCode {

    private lazy var verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.enableViewCode()
        return stack
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    func setupHierarchy() {

    }

    func setupConstraints() {

    }
}


