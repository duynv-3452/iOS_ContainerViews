//
//  FoodDetailViewController.swift
//  ContainerView
//
//  Created by nguyen.van.duyb on 4/8/24.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    
    var food: FoodModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView() {
        title = "Detail Food"
        foodName.font = .boldSystemFont(ofSize: 24)
        foodDescription.textColor = .secondaryLabel
        foodDescription.numberOfLines = 0
        if let food = food {
            foodImage.image = food.image
            foodName.text = food.name
            foodDescription.text = food.description
        }
    }
}
