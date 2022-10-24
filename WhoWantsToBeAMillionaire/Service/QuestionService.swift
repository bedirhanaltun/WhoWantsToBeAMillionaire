//
//  QuestionService.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 23.10.2022.
//

import Foundation

final class QuestionService {
    
    func downloadQuestions(completion: @escaping ([QuestionResults]?) -> Void) {
        
        guard let url = URL(string: APIUrls.questionsAPI()) else {return}
        
        NetworkManager.shared.downloadQuestions(url: url) { [weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case.success(let data):
                completion(self.handleWithData(data))
            case .failure(let error):
                self.handleWithError(error)
            }
        }
    }
    
    private func handleWithData(_ data: Data) -> [QuestionResults]? {
        do {
            let question = try JSONDecoder().decode(Question.self, from: data)
            return question.results
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    
}
