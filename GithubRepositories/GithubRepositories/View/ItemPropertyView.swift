//
//  ItemPropertyView.swift
//  GithubRepositories
//
//  Created by Ростислав on 2/24/18.
//  Copyright © 2018 Ростислав. All rights reserved.
//

import UIKit

class ItemPropertyView: NibView {

    // Outlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!

    func configure(_ image: UIImage, _ labelText: String) {
        itemLabel.text = labelText
        itemImageView.image = image
        
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
    }
}
