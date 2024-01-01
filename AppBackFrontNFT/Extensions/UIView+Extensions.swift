import UIKit

extension UIView {
    func enableViewCode() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func roundCorners(cornerRadiuns: Double,typeCorners: CACornerMask){
        self.layer.cornerRadius = CGFloat(cornerRadiuns)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
}
