//
//  PlacesListViewController.swift
//  Guia Universitaria
//
//  Created by Marc De Jesus on 10/17/18.
//  Copyright © 2018 Archivo Universitario. All rights reserved.
//

import UIKit

class PlacesListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // Holds the names and descriptions of the places
    var nameOfPlaces = [String]()
    var descpOfPlaces:NSArray = []
    
    // Variables for the search
    var searchPlace = [String]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Name of all the places in the list
        nameOfPlaces = ["Facultad de Ciencias Naturales", "Facultad de Humanidades", "Facultad de Administración de Empresas", "Facultad de Ciencias Sociales", "Facultad de Estudios Generales", "Facultad de Educación",]
        descpOfPlaces = ["La Facultad de Ciencias Naturales...", "La Facultad de Humanidades...", "La Facultad de Administración de Empresas...", "La Facultad de Ciencias Sociales...", "La Facultad de Estudios Generales...", "La Facultad de Educación...", ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (isSearching) { // return count of the search array
            return searchPlace.count
        }
        else { // return count of the original full array of names
            return nameOfPlaces.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Prepares the format for the table cells
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesListTableViewCell") as! PlacesListTableViewCell
        
        if (isSearching) {
            // Gives the cell the name of the place in the search list
            cell.nameOfPlace.text! = searchPlace[indexPath.row]
        }
        else {
            // Gives the label nameOfPlace in PlacesListTableViewCell a value from the array
            cell.nameOfPlace.text! = nameOfPlaces[indexPath.row]
        }
        
        // Gives the label nameOfPlace in PlacesListTableViewCell a value from the array
        //cell.nameOfPlace.text! = nameOfPlaces[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        // Connects the PlacesListViewCOntroller with PlaceDetailViewController
        let pdvc = Storyboard.instantiateViewController(withIdentifier: "PlaceDetailViewController") as! PlaceDetailViewController
        
        // Passes the name to the detail view
        pdvc.getNameOfPlace = nameOfPlaces[indexPath.row]
        // Passes the description to the detail view
        pdvc.getDescpOfPlace = descpOfPlaces[indexPath.row] as! String
        
        // Transition to detail view controller
        self.navigationController?.pushViewController(pdvc, animated: true)
    }
    
    // Function that manages the table searchbar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // If the searchBar is empty, that means that the user is not searching
        if (searchBar.text == nil || searchBar.text == "") {
            isSearching = false
            //view.endEditing(true)
            tableView.reloadData()
        }
        // else the user is searching for something
        else {
            isSearching = true
            // Filter the items in nameOfPlaces by the text in the searchbar and put it in the array for the search
            searchPlace = nameOfPlaces.filter({$0.lowercased().contains(searchText.lowercased())})
            tableView.reloadData()
        }
    }
    
    // function that allows the user to stop searching, i.e. removes the on screen keyboard
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        view.endEditing(true)
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
