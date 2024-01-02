import UIKit
import AlamofireImage

final class MagnifyingGlass: UIViewController {

    private var screen =  MagnifyingGlassView()
    private var urlImage: String

    required init(urlImage: String) {
        self.urlImage = urlImage
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    override func loadView() {
        super.loadView()
        view = screen
        setupImage()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate = self
    }

    private func setupImage() {
        guard let url = URL(string: urlImage) else { return }
        screen.nftImageView.af.setImage(withURL: url)
    }

}

extension MagnifyingGlass: MagnifyingGlassDelegate {
    func tappedBackButton() {
        dismiss(animated: true)
    }
}
