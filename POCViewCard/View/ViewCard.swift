//
//  ViewCard.swift
//  POCViewCard
//
//  Created by Paulo Henrique Gomes da Silva on 21/11/22.
//

import UIKit

class ViewCard: UIView {
    let radius = UIScreen.main.bounds.width * 0.18 / 2

    lazy var circleDepartment = make(UIView()) {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = radius
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }

    lazy var departmentIcon = make(UIImageView()) {
        $0.tintColor = .black
        $0.image = UIImage(systemName: "building.2.fill")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var circlePontuation = make(UIView()) {
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = radius
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }

    lazy var pontuation = make(UILabel()) {
        $0.font = .systemFont(ofSize: radius)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
    }

    lazy var cardName = make(UILabel()) {
        $0.font = .systemFont(ofSize: 22)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
    }

    lazy var cardDescription = make(UILabel()) {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 22)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(model: Card) {
        cardName.text = model.name
        cardDescription.text = model.description
        pontuation.text = String(model.pontuation)
    }
}

extension ViewCard: ViewCoding {
    func setupView() {
        self.backgroundColor = UIColor(named: "cardBG")
    }

    func setupHierarchy() {
        addSubview(cardName)
        addSubview(cardDescription)
        addSubview(circleDepartment)
        addSubview(circlePontuation)
        addSubview(departmentIcon)
        addSubview(pontuation)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            // name constraints
            cardName.topAnchor.constraint(equalTo: self.centerYAnchor, constant: 20),
            cardName.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            // description constraints
            cardDescription.topAnchor.constraint(equalTo: cardName.topAnchor, constant: 22),
            cardDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            cardDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cardDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 10),
            // circle constraints
            circleDepartment.heightAnchor.constraint(equalToConstant: radius * 2),
            circleDepartment.widthAnchor.constraint(equalToConstant: radius * 2),
            circleDepartment.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            circleDepartment.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            // icon constraints
            departmentIcon.centerXAnchor.constraint(equalTo: circleDepartment.centerXAnchor),
            departmentIcon.centerYAnchor.constraint(equalTo: circleDepartment.centerYAnchor),
            departmentIcon.heightAnchor.constraint(equalToConstant: radius * 0.8),
            departmentIcon.widthAnchor.constraint(equalToConstant: radius * 0.8),
            // circle pontuation constraints
            circlePontuation.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            circlePontuation.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            circlePontuation.heightAnchor.constraint(equalToConstant: radius * 2),
            circlePontuation.widthAnchor.constraint(equalToConstant: radius * 2),
            // pontuation constraints
            pontuation.centerXAnchor.constraint(equalTo: circlePontuation.centerXAnchor),
            pontuation.centerYAnchor.constraint(equalTo: circlePontuation.centerYAnchor)
        ])
    }
}
