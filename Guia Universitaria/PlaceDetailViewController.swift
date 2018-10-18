//
//  PlaceDetailViewController.swift
//  Guia Universitaria
//
//  Created by Marc De Jesus on 10/17/18.
//  Copyright © 2018 Archivo Universitario. All rights reserved.
//

import UIKit

class PlaceDetailViewController: UIViewController {

    var getNameOfPlace = String()
    var getDescpOfPlace = String()
    
    @IBOutlet weak var nameOfPlaceDetail: UILabel!
    @IBOutlet weak var descpOfPlaceDetail: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Recibe la data de Place List View
        
        nameOfPlaceDetail.text! = getNameOfPlace
        descpOfPlaceDetail.text! = getDescpOfPlace
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
