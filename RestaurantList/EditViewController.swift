//
//  EditViewController.swift
//  RestaurantList
//
//  Michelle Yun and Victoria Lei
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var ratingText: UILabel!
    
    var prevVC = RestaurantListTableViewController()
    var restaurant : Restaurant?  = nil
    var loc = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurant = prevVC.restaurantList[loc]
        if let r = restaurant {
            name.text = r.name
            type.text = r.type
            ratingText.text = r.rating
            let num = Int(ratingText.text!)
            stepper.value = Double(num!)
        }
    }//viewDidLoad
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        ratingText.text = Int(sender.value).description
    }//stepperValueChanged
    
    @IBAction func save(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext{
            
            context.delete(restaurant!)
            
            let restaurant = Restaurant(entity: Restaurant.entity(), insertInto: context)
            
            if let restName = name.text {
                restaurant.name = restName
                restaurant.type = type.text
                restaurant.rating = ratingText.text
            }
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
    }//save

}//EditViewController
