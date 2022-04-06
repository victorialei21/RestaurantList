//
//  RestaurantListTableViewController.swift
//  RestaurantList
//
//  Michelle Yun and Victoria Lei
//

import UIKit

class RestaurantListTableViewController: UITableViewController {
    var restaurantList : [Restaurant] = []
    var loc = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRestaurants()

    }//viewDidLoad
    
    func getRestaurants(){
        if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext{
            if let restaurantCoreData = try? context.fetch(Restaurant.fetchRequest()) as? [Restaurant] {
                restaurantList = restaurantCoreData
                tableView.reloadData()
            }
        }
    }//getRestaurants
    
    override func viewWillAppear(_ animated: Bool) {
        getRestaurants()
        
    }//viewWillAppear

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantList.count
    }//tableView numberOfRowsInSection


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        let restaurantName = restaurantList[indexPath.row].name
        cell.textLabel?.text = restaurantName
        return cell
    }//tableView cellForRowAt
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        loc = indexPath.row
        performSegue(withIdentifier: "editSegue", sender: restaurantList[indexPath.row])
    }//tableView didSelectRowAt

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let restaurant = restaurantList[indexPath.row]
            if let context = (UIApplication.shared.delegate as?AppDelegate)?.persistentContainer.viewContext{
                context.delete(restaurant)
                getRestaurants()
            }
        }
    }//tableView forRowAt
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let editVC = (segue.destination as? EditViewController) {
            let restaurant = sender as! Restaurant
            editVC.restaurant = restaurant
            editVC.loc = loc
            editVC.prevVC = self
        }
        else if  let editVC = (segue.destination as? AddViewController) {
            editVC.prevVC = self
        }
    }//prepare

}//RestaurantListTableViewController
