//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Outlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()//Objeto del modelo para acceder a las preguntas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()//Metodo para actualizar interface cada vez que se cargue
    }

    
    //Accion para contestar pregunta
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!//Forma de obtener el titulo de la respuesta escogida
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)//Verificacion de respuesta correcto con el metodo del modelo QuizBrain checkAnswer
        
        if userGotItRight {
            //Si se respondio correctamente
            sender.backgroundColor = UIColor.green//Pinta el color de la respuesta correcta en verde
        } else {
            //Si se respondio mal
            sender.backgroundColor = UIColor.red//Pinta el color de la respuesta incorrecta en rojo
        }
        
        quizBrain.nextQuestion()//Mediante el modelo QuizBrain se pasa a la siguiente pregunta con el metodo nextQuestion
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)//Intervalo de tiempo para cambiar a siguiente pregunta
    }
    
    //Metodo de Obj C, permite actualizar los campos con:
    //El texto de la pregunta, la barra de progreso, el puntaje obtenido
    @objc func updateUI() {
        //Mediante el objeto creado del modelo QuizBrain se obtiene la informacion de metodos
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //Se limpian los BG de los botones a sus colores pre establecidos en diseño
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

}


























