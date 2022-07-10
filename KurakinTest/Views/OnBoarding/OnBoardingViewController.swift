//
//  OnBoardingViewController.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var slides : [OnBoardingSlide] = []
    var currentPage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        

        slides = [OnBoardingSlide(title: "Safety",
                                  description: "All data in the storage is available only to you, no one can access it, even we, all data is stored locally",
                                  image: UIImage.init(named: "imgSlide1")!),
                  OnBoardingSlide(title: "Securing Data",
                                  description: "All your data is securely password protected. You can also set access only by face ID",
                                  image: UIImage.init(named: "imgSlide2")!),
                  OnBoardingSlide(title: "Only Important",
                                  description: "Keep only the most important data: passwords, bank cards, photos and more thanks to GuardGrade",
                                  image: UIImage.init(named: "imgSlide3")!)]

    }

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(withIdentifier: "PasswordNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .coverVertical
            present(controller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
            pageControl.currentPage = currentPage
        }
        
    }
    
}

extension OnBoardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionViewCell.identifier, for: indexPath) as! OnBoardingCollectionViewCell
        
        cell.setup(slides[indexPath.row ])
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentPage
    }
    
}
