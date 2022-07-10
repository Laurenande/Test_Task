//
//  OnBoardingCollectionViewCell.swift
//  KurakinTest
//
//  Created by Егор Куракин on 09.07.2022.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    static let identifier = "OnBoarding"
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ slide: OnBoardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
