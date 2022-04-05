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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantList.count
    }//tableView

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var restaurantName = restaurantList[indexPath.row].name
        cell.textLabel?.text = restaurantName
        return cell
    }//tableView
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        loc = indexPath.row
//        performSegue(withIdentifier: "editSegue", sender: restaurantList[indexPath.row])
//    }//didSelectRowAt
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
