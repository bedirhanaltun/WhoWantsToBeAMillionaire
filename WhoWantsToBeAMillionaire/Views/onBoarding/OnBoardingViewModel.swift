//
//  OnBoardingViewModel.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 23.10.2022.
//

import Foundation

protocol OnBoardingViewModelProtocol {
    func viewDidLoad()
}

final class OnBoardingViewModel {
    
    weak var view: OnBoardingViewProtocol?
}

extension OnBoardingViewModel: OnBoardingViewModelProtocol {
    func viewDidLoad() {
        view?.configureCollectionView()
    }
    
}
