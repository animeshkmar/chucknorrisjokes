//
//  CategoryCell.swift
//  Chuck Norris Jokes
//
//  Created by Animesh Kumar on 14/04/20.
//  Copyright © 2020 Animesh K. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    let categoryLabel = Label(frame: .null, content: "", size: 18, alignment: .left, fontWeight: .regular, color: .systemOrange)
    
    func configCategoryCell(categoryName: String) -> Void {
        
        addSubview(categoryLabel)
        categoryLabel.text = categoryName
        
        // SETUP LABEL CONSTRAINTS
        categoryLabel.translatesAutoresizingMaskIntoConstraints                                     = false
        categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive       = true
        categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive    = true
        categoryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive                = true
        categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive          = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 60).isActive                         = true
    }
    

}
