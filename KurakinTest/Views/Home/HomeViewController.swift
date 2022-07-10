//
//  HomeViewController.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit
import SPStorkController

class HomeViewController: UIViewController {
    @IBOutlet weak var segmentControll: UISegmentedControl!
    let transitionDelegate = SPStorkTransitioningDelegate()
    
    //hide navigation bar in first vc
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated:animated)
    }
    //show navigation bar in all other vc
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated:animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
    }
    
    @IBAction func buttonBar(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddView"){
            vc.transitioningDelegate = transitionDelegate
            vc.modalPresentationStyle = .custom
            vc.modalPresentationCapturesStatusBarAppearance = true
            transitionDelegate.showIndicator = false
            transitionDelegate.showCloseButton = false
            transitionDelegate.customHeight = 300
            self.present(vc, animated: true, completion: nil)
        }

    }
    
    @IBAction func open(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddView"){
            vc.transitioningDelegate = transitionDelegate
            vc.modalPresentationStyle = .custom
            vc.modalPresentationCapturesStatusBarAppearance = true
            transitionDelegate.showIndicator = false
            transitionDelegate.showCloseButton = false
            transitionDelegate.customHeight = 300
            self.present(vc, animated: true, completion: nil)

            
        }
    }
 

}


