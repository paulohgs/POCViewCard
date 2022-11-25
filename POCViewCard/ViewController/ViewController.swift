//
//  ViewController.swift
//  POCViewCard
//
//  Created by Paulo Henrique Gomes da Silva on 21/11/22.
//

import UIKit

class ViewController: UIViewController {

    var expanded: Bool = true

    let mainView = MainCardView()
    let card = Card(name: "Presidente",
                    description: "Maior cargo e responsável por assinar e executar lei.",
                    pontuation: 1
    )

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.viewCard.configure(model: card)
        let tapRecogonizer = UITapGestureRecognizer(target: self, action: #selector(expandView(_:)))
        mainView.viewCard.addGestureRecognizer(tapRecogonizer)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.viewCard.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
    }

    @objc func expandView(_ sender: UITapGestureRecognizer) {
        if expanded {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 1,
                options: .curveEaseInOut,
                animations: { [self] in
                    mainView.viewCard.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        } else {
            UIView.animate(
                withDuration: 1,
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 1,
                options: .curveEaseInOut,
                animations: { [self] in
                    mainView.viewCard.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
            })
        }
        expanded.toggle()
    }
}
