//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 07/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
//Estructura para el modelado de preguntas teniendo el texto de la pregunta y la respuesta
struct Question {
    let question: String
    let answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}

    
