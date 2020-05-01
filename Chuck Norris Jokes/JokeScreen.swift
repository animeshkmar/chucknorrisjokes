//
//  JokeScreenViewController.swift
//  Chuck Norris Jokes
//
//  Created by Animesh Kumar on 14/04/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class JokeScreen: UIViewController {
    
    var category: String    = ""
    var jokeLabel           = Label(frame: .null, content: "Fetching...", size: 20, alignment: .center, fontWeight: .heavy, color: .systemOrange)
    
    let service             = Services()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = category.capitalized
        view.backgroundColor = .black
        view.addSubview(jokeLabel)
        setJokeLabelContstraints()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        jokeLabel.text = service.fetchJokeInCategory(category: category)
    }
    
    func setJokeLabelContstraints() {
        jokeLabel.translatesAutoresizingMaskIntoConstraints                                         = false
        jokeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive      = true
        jokeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive    = true
        jokeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive       = true
    }
    
    

}


