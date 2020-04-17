//
//  FlagTableViewController.swift
//  Flags Of The World
//
//  Created by adil gupta on 16/04/20.
//  Copyright © 2020 priyam. All rights reserved.
//

import UIKit


class FlagTableViewController: UITableViewController {
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditingMode = tableView.isEditing
        tableView.setEditing(!tableViewEditingMode, animated: true)
    }
    
    var flags: [Flag] = [Flag(flag: "🇦🇺", country: "Australia", region: "Oceania", population: "27890"),
    Flag(flag: "🇺🇸", country: "United States", region: "North America", population: "100000"),
        Flag(flag: "🇮🇳", country: "India", region: "Asia", population: "1990000000"),
        Flag(flag: "🇿🇦", country: "South Africa", region: "Africa", population: "9000"),
        Flag(flag: "🇵🇰", country: "Pakistan", region: "Asia", population: "100000"),
        Flag(flag: "🇬🇧", country:"United Kingdom", region: "Europe", population: "101011"),
        Flag(flag: "🇵🇪", country: "Peru", region: "South America", population: "20202002"),
        Flag(flag: "🇯🇲", country: "Jamaica", region: "Africa", population: "100000"),
        Flag(flag: "🇯🇵", country: "Japan", region: "Asia", population: "1000000"),
        Flag(flag: "🇩🇪", country: "Germany", region: "Europe", population: "90000"),
        Flag(flag: "🇨🇦", country: "Canada", region: "North America", population: "5000")]
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let flag = flags[indexPath.row]
        print("\(flag.flag) \(indexPath)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
 
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return flags.count
        }
        else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        let flag = flags[indexPath.row]
        cell.textLabel?.text = "\(flag.flag) - \(flag.country)"
        cell.detailTextLabel?.text = flag.region
        cell.showsReorderControl = true
        // Configure the cell...

        return cell
    }
    

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

   
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedFlag = flags.remove(at: fromIndexPath.row)
        flags.insert(movedFlag, at: to.row)
        tableView.reloadData()

    }
  

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
