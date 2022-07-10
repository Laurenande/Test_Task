//
//  testViewController.swift
//  KurakinTest
//
//  Created by Егор Куракин on 10.07.2022.
//

import UIKit

class testViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        generateTabBar()
        //setTabBarAppearance()
        // Do any additional setup after loading the view.
    }
    

    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: HomeViewController(),
                title: "Home",
                image: UIImage(systemName: "house.fill")
            ),
            generateVC(
                viewController: testViewController(),
                title: "Personal Info",
                image: UIImage(systemName: "person.fill")
            ),
            generateVC(
                viewController: testViewController(),
                title: "Settings",
                image: UIImage(systemName: "slider.horizontal.3")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        //roundLayer.fillColor = UIColor.green
        
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .darkGray
    }

}
