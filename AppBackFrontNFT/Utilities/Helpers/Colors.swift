import UIKit


final class ColorsHelpers: UIView {

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
        gradientLayer.frame = self.bounds

        self.layer.insertSublayer(gradientLayer, at:0)
    }

    

}
