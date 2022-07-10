//
//  ChildViewController.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit

class ChildViewController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = UIColor(hue: 0.2, saturation: 0.8, brightness: 0.9, alpha: 1)
            view.layer.cornerRadius = 24
            
            addDismissButton()
        }
        
        private func addDismissButton() {
            let button = UIButton(type: .system)
            button.setTitle("Dismiss", for: .normal)
            button.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
            view.addSubview(button)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 80),
                ])
        }
        
        @objc func dismissSelf() {
            self.dismiss(animated: true)

}
}
