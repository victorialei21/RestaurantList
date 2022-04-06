//
//  AddViewController.swift
//  RestaurantList
//
//  Michelle Yun and Victoria Lei
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var ratingText: UILabel!
    var prevVC = RestaurantListTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.value = 3
        ratingText.text = Int(stepper.value).description
    }//viewDidLoad
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        ratingText.text = Int(sender.value).description
    }//stepperValueChanged

    @IBAction func save(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext{
            
            let restaurant = Restaurant(entity: Restaurant.entity(), insertInto: context)
            
            if let restName = name.text {
                restaurant.name = restName
                restaurant.type = type.text
                restaurant.rating = ratingText.text
            }
            try? context.save()
            prevVC.getRestaurants()
            navigationController?.popViewController(animated: true)
        }
    }//save
    
}//AddViewController
