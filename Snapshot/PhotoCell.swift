//
//  PhotoCell.swift
//  Snapshot
//
//  Created by Monte's Pro 13" on 3/2/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit
import Parse

class PhotoCell: UITableViewCell{
    
    @IBOutlet weak var PhotoView: UIImageView!
    
    @IBOutlet weak var captionField: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
