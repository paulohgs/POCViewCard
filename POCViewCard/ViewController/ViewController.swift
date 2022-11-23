//
//  ViewController.swift
//  POCViewCard
//
//  Created by Paulo Henrique Gomes da Silva on 21/11/22.
//

import UIKit

class ViewController: UIViewController {

    let mainView = MainCardView()
    let card = Card(name: "Presidente",
                    description: "Maior cargo e responsável por assinar e executar leis.",
                    pontuation: 1
    )

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.viewCard.configure(model: card)
//        viewCard.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//            UIView.animate(
//                withDuration: 2,
//                delay: 1,
//                usingSpringWithDamping: 0.7,
//                initialSpringVelocity: 1,
//                options: .curveEaseInOut,
//                animations: { [self] in
//                    viewCard.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
//                    viewCard.transform = CGAffineTransform(scaleX: 1, y: 1)
//        })
    }
}
