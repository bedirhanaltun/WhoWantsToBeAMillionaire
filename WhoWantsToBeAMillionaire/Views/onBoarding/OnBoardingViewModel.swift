//
//  OnBoardingViewModel.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 23.10.2022.
//

import Foundation

protocol OnBoardingViewModelProtocol {
    func viewDidLoad()
    func getQuestions()
}

final class OnBoardingViewModel {
    
    let service = QuestionService()
    weak var view: OnBoardingViewProtocol?
}

extension OnBoardingViewModel: OnBoardingViewModelProtocol {
    func viewDidLoad() {
        view?.configureCollectionView()
        getQuestions()
    }
    
    func getQuestions() {
        service.downloadQuestions { [weak self] returnedQuestions in
            guard let self = self else {return}
            guard let returnedQuestions = returnedQuestions else {return}
            
            print(returnedQuestions)
        }
        
    }
    
}
