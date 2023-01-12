//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    //Inicializacion de valores
    var questionNumber = 0
    var score = 0
    
    //Propiedad que contiene las preguntas y respuestas
    //Esta propiedad es de tipo [Question]
    //Es un diccionario que contiene objetos de la estructura Question
    let quiz = [
        Question(question: "A slug's blood is green.", answer: "True"),
        Question(question: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        Question(question: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        Question(question: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        Question(question: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        Question(question: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        Question(question: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        Question(question: "Google was originally called 'Backrub'.", answer: "True"),
        Question(question: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        Question(question: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        Question(question: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        Question(question: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    
    //Funcion para obtener el texto de la pregunta
    func getQuestionText() -> String {
        return quiz[questionNumber].question//Retorna el texto de la pregunta en la posicion 0 de questionNumber, este cambia por el incremento en el contador
    }
    
    //Funcion para obtener el progreso de la barra
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)//Se obtiene el progreso con el calculo de: el numero de pregunta actual; inicia con 1 / la cantidad total de preguntas del quiz
    }
    
    //Funciona para obtener el puntaje
    mutating func getScore() -> Int {
        return score
    }
    
    //Funciona para cambiar a la siguiente pregunta
    mutating func nextQuestion() {
        //Mientras el numero actual de pregunta sea menor al total de los de quiz se incrementara en 1 el contador de questionNumber
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            //Si el numero actual ya no es menor al numero total de preguntas, entonces se regresa a 0
            questionNumber = 0
        }
    }
    
    //Funcion para checar respuesta correcta
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Si la respuesta es correcta, entonces
        if userAnswer == quiz[questionNumber].answer {
            //Incrementa 1 el puntaje
            score += 1
            //Y regresa verdadero
            return true
        } else {
            //Si no, regresa falso
            return false
        }
    }
}

