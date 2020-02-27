//
//  ViewController.swift
//  CocoapodsDemo
//
//  Created by Margiett Gil on 2/27/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit
import Kingfisher

class CocktailViewController: UIViewController {
  private let cocktailView = CocktailView()
   
  override func loadView() {
    view = cocktailView
  }
   
  private lazy var swipeGesture: UISwipeGestureRecognizer = {
    let gesture = UISwipeGestureRecognizer()
    gesture.addTarget(self, action: #selector(fetchCocktail))
    gesture.direction = .left
    return gesture
  }()
   
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    fetchCocktail()
    cocktailView.cocktailImage.isUserInteractionEnabled = true
    cocktailView.cocktailImage.addGestureRecognizer(swipeGesture)
  }
   
  override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      fetchCocktail()
    }
  }
  @objc private func fetchCocktail() {
    APIClient.fetchCocktail { [weak self] (result) in
      switch result {
      case .failure(let error):
        print("error \(error)")
      case .success(let cocktail):
        self?.updateUI(cocktail)
      }
    }
  }
   
  private func updateUI(_ cocktail: Cocktail) {
    cocktailView.cocktailNameLabel.text = cocktail.strDrink
    cocktailView.cocktailIngredients.text = cocktail.ingredients
    guard let imageURL = URL(string: cocktail.strDrinkThumb) else {
      return
    }
    cocktailView.cocktailImage.kf.setImage(with: imageURL)
     
    UIView.transition(with: cocktailView.cocktailImage, duration: 0.75, options: [.transitionFlipFromTop], animations: { self.cocktailView.cocktailImage.kf.setImage(with: imageURL)
    }, completion: nil)
     
  }
}

//class CocktailViewController: UIViewController {
//    private let cocktailView = CocktailView()
//
//    private lazy var swipeGesture: UISwipeGestureRecognizer = {
//        let gesture = UISwipeGestureRecognizer()
//        gesture.addTarget(self, action: #selector(fetchCocktail))
//        gesture.direction = .left
//       return gesture
//    }()
//
//    override func loadView() {
//        view = cocktailView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.backgroundColor = .systemBackground
//        fetchCocktail()
//
//        //setup swipe gesture on cocktailimage
//        cocktailView.cocktailImage.isUserInteractionEnabled = true
//        cocktailView.cocktailImage.addGestureRecognizer(swipeGesture)
//    }
//
//    //shake device to change cocktail
//
//    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
//        if motion == .motionShake{
//            fetchCocktail()
//        }
//    }
//
//   @objc private func fetchCocktail(){
//        APIClient.fetchCocktail { [weak self] (result) in
//            switch result {
//            case .failure(let error):
//                print("")
//            case .success(let cocktail):
//                DispatchQueue.main.async {
//                    self?.updateUI(cocktail)
//                }
//
//            }
//        }
//    }
//    private func updateUI(_ cocktail: Cocktail){
//        cocktailView.cocktailNameLabel.text = cocktail.strDrink
//        cocktailView.cocktailIngredient.text = cocktail.ingredients
//        guard let imageURL = URL(string: cocktail.strDrinkThumb) else {
//            return
//        }
//        cocktailView.cocktailImage.kf.setImage(with: imageURL)
//        UIView.transition(with: cocktailView.cocktailImage, duration: 0.03, options: [.transitionFlipFromRight], animations: {
//            self.cocktailView.cocktailImage.kf.setImage(with: imageURL)
//        }, completion: nil)
//    }
//
//}
//
