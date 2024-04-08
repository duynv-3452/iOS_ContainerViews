//
//  HomeTableViewCell.swift
//  ContainerView
//
//  Created by nguyen.van.duyb on 4/8/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        foodImage.layer.cornerRadius = 8
        foodName.font = .boldSystemFont(ofSize: 20)
        foodDescription.numberOfLines = 2
        foodDescription.textColor = .secondaryLabel
        foodDescription.font = .systemFont(ofSize: 14)
    }
    
    func configCell(food: FoodModel) {
        foodImage.image = food.image
        foodName.text = food.name
        foodDescription.text = food.description
    }
}
