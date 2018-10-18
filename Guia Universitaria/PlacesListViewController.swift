//
//  PlacesListViewController.swift
//  Guia Universitaria
//
//  Created by Marc De Jesus on 10/17/18.
//  Copyright © 2018 Archivo Universitario. All rights reserved.
//

import UIKit

class PlacesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var nameOfPlaces:NSArray = []
    var descpOfPlaces:NSArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Name of all the places in the list
        nameOfPlaces = ["Facultad de Ciencias Naturales", "Facultad de Humanidades"]
        descpOfPlaces = ["La Facultad de Ciencias Naturales...", "La Facultad de Humanidades..."]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Prepares the format for the table cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesListTableViewCell") as! PlacesListTableViewCell
        
        // Gives the label nameOfPlace in PlacesListTableViewCell a value from the array
        cell.nameOfPlace.text! = nameOfPlaces[indexPath.row] as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Connects the PlacesListViewCOntroller with PlaceDetailViewController
        let pdvc = Storyboard.instantiateViewController(withIdentifier: "PlaceDetailViewController") as! PlaceDetailViewController
        
        // Passes the name to the detail view
        pdvc.getNameOfPlace = nameOfPlaces[indexPath.row] as! String
        // Passes the description to the detail view
        pdvc.getDescpOfPlace = descpOfPlaces[indexPath.row] as! String
        
        // Transition to detail view controller
        self.navigationController?.pushViewController(pdvc, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
