//
//  QuestionViewModel.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 24.10.2022.
//

import Foundation

protocol QuestionViewModelProtocol {
    var view: QuestionScreenViewProtocol? {get set}
    func viewDidLoad()
}

final class QuestionViewModel {
    let service = QuestionService()
    weak var view: QuestionScreenViewProtocol?
    var questionsList: [QuestionResults] = []
}

extension QuestionViewModel: QuestionViewModelProtocol {

    func viewDidLoad() {
        getQuestions()
    }
    
    func getQuestions() {
        service.downloadQuestions { [weak self] returnedQuestions in
            guard let self = self else {return}
            guard let returnedQuestions = returnedQuestions else {return}
            self.questionsList = returnedQuestions
            self.view?.reloadTableView()
            
            
        }
        
    }
    
}


