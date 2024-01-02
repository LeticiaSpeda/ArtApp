protocol ViewCode {
    func commonInit()
    func setupHierarchy()
    func setupConstraints()
    func setupStyle()
    func setupActions()
}

extension ViewCode {
    func commonInit() {
        setupHierarchy()
        setupConstraints()
        setupStyle()
        setupActions()
    }

    func setupStyle() {}
    func setupActions() {}
}
