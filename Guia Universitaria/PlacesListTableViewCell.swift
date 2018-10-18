//
//  PlacesListTableViewCell.swift
//  Guia Universitaria
//
//  Created by Marc De Jesus on 10/17/18.
//  Copyright © 2018 Archivo Universitario. All rights reserved.
//

import UIKit

class PlacesListTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
