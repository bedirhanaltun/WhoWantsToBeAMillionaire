//
//  OnBoardingCell.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 22.10.2022.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardingCell.self)
    
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideImageView: UIImageView!
    
    func setup(_ slide: OnBoardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
    }
}
