//
//  HomeViewController.swift
//  ContainerView
//
//  Created by nguyen.van.duyb on 4/8/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dataSource = [FoodModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        prepareDataSource()
    }
    
    private func configView() {
        title = "Food"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    private func prepareDataSource() {
        dataSource = [
            FoodModel(name: "Pizza",
                      description: "A delicious Italian dish consisting of a usually round, flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients such as anchovies, mushrooms, onions, olives, pineapple, meat, etc.",
                      image: UIImage(named: "pizza")),
            FoodModel(name: "Sushi",
                      description: "A Japanese dish consisting of small balls or rolls of vinegar-flavored cold-cooked rice served with a garnish of raw fish, vegetables, or egg.",
                      image: UIImage(named: "sushi")),
            FoodModel(name: "Burger",
                      description: "A sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun.",
                      image: UIImage(named: "burger")),
            FoodModel(name: "Pho",
                      description: "A Vietnamese soup consisting of broth, rice noodles, herbs, and meat, sometimes made with chicken or beef.",
                      image: UIImage(named: "pho")),
            FoodModel(name: "Taco",
                      description: "A traditional Mexican dish consisting of a folded or rolled tortilla filled with various mixtures, such as seasoned meat, beans, lettuce, and cheese.",
                      image: UIImage(named: "taco")),
            FoodModel(name: "Pasta",
                      description: "A type of noodle dishes originating from Italy, consisting of dough made from durum wheat and water, extruded or stamped into various shapes, and typically cooked in boiling water.",
                      image: UIImage(named: "pasta")),
            FoodModel(name: "Steak",
                      description: "A meat generally sliced across the muscle fibers, potentially including a bone.",
                      image: UIImage(named: "steak")),
        ]
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.configCell(food: dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "FoodDetailViewController") as? FoodDetailViewController
        {
            vc.food = dataSource[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
