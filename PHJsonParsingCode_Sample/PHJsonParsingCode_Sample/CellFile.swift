//
//  CellFile.swift
//  PHJsonParsingCode_Sample
//
//  Created by DeEp KapaDia on 22/01/19.
//  Copyright © 2019 DeEp KapaDia. All rights reserved.
//

import UIKit

class CellFile: UITableViewCell {

    @IBOutlet weak var id: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var pass: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
