//
//  Questions.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Bedirhan Altun on 23.10.2022.
//

import Foundation

struct Question: Codable {
    let responseCode: Int
    let results: [QuestionResults]

    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}

struct QuestionResults: Codable {
    let category: String
    let type: TypeEnum
    let difficulty: Difficulty
    let question, correctAnswer: String
    let incorrectAnswers: [String]

    enum CodingKeys: String, CodingKey {
        case category, type, difficulty, question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum Difficulty: String, Codable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum TypeEnum: String, Codable {
    case boolean = "boolean"
    case multiple = "multiple"
}
