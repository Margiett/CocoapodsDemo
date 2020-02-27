//
//  CocktailView.swift
//  CocoapodsDemo
//
//  Created by Margiett Gil on 2/27/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import SnapKit

class CocktailView: UIView {
    
    public lazy var cocktailNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 2
        label.text = "Cocktail Name"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var cocktailIngredients: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 5
        label.text = "Ingredients:"
        label.textAlignment = .center
        return label
    }()
    
    public lazy var cocktailImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(systemName: "photo.fill")
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupCocktailImageConstraints()
        setupLabelConstraints()
        setupIngredientsConstraints()
    }
    
    private func setupCocktailImageConstraints() {
        addSubview(cocktailImage)
        cocktailImage.snp.makeConstraints { (make) in
            make.top.leading.bottom.trailing.equalTo(self)
        }
    }
    
    private func setupLabelConstraints() {
        addSubview(cocktailNameLabel)
        
        cocktailNameLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
    private func setupIngredientsConstraints() {
        addSubview(cocktailIngredients)
        
        cocktailIngredients.snp.makeConstraints { (make) in
            make.top.equalTo(cocktailImage).offset(200)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
    }
    
}




//class CocktailView: UIView {
//
//    // cocktail name label
//    public lazy var cocktailNameLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
//        label.numberOfLines = 2
//        label.text = "Cocktail Name"
//        return label
//    }()
//      // cocktail image
//    public lazy var cocktailImage: UIImageView = {
//        let iv = UIImageView()
//        iv.image = UIImage(systemName: "photo")
//        return iv
//    }()
//
//    public lazy var cocktailIngredient: UILabel = {
//       let label = UILabel()
//        label.font = UIFont.preferredFont(forTextStyle: .title1)
//        label.text = "Cocktail Ingredient"
//        label.numberOfLines = 0
//        return label
//    }()
//
//
//
//    override init(frame: CGRect) {
//        super.init(frame: UIScreen.main.bounds)
//    }
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//    private func commonInit() {
//        setupCocktailName()
//        setupImage()
//        setupCocktailIngredient()
//    }
//    private func setupImage(){
//        addSubview(cocktailImage)
//
//        cocktailImage.snp.makeConstraints{ (make) in
//            make.top.leading.bottom.trailing.equalTo(self)
//
//        }
//    }
//
//    private func setupCocktailName(){
//        addSubview(cocktailNameLabel)
//
//        cocktailNameLabel.snp.makeConstraints { (make) in
//            make.top.leading.equalTo(self.safeAreaLayoutGuide).inset(20)
//
//        }
//
//    }
//
//    private func setupCocktailIngredient(){
//        addSubview(cocktailIngredient)
//
//        cocktailIngredient.snp.makeConstraints { (make) in
//            make.leading.bottom.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
//        }
//
//    }
//
//}
