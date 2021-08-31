//
//  CollectionViewCell.swift
//  StackViews
//
//  Created by djiang on 7/07/21.
//

import UIKit

class CollectionViewCell1: UICollectionViewCell {
    override func prepareForReuse() {
        super.prepareForReuse()
    }

    lazy var isLabel2Hidden: Bool = false {
        didSet {
            label2.isHidden = isLabel2Hidden
        }
    }

    lazy var useFrame: Bool = false {
        didSet {
            stackView.translatesAutoresizingMaskIntoConstraints = useFrame
        }
    }

    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .blue
        view.axis = .vertical
        return view
    }()

    lazy var label1: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.backgroundColor = .orange
        view.text = "label 1"
        return view
    }()

    lazy var label2: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.backgroundColor = .yellow
        view.text = "label 2"
        return view
    }()

    lazy var label3: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        view.backgroundColor = .yellow
        view.text = "label 3"
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupUIs()
        setupCons()
    }

    func setupUIs() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
    }

    func setupCons() {
        stackView.snp.makeConstraints { m in
            m.width.greaterThanOrEqualTo(200)
            m.top.equalTo(contentView.snp.top)
            m.leading.equalTo(contentView.snp.leading)
            m.bottom.equalTo(contentView.snp.bottom).priority(.high)
            m.trailing.equalTo(contentView.snp.trailing).priority(.high)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}