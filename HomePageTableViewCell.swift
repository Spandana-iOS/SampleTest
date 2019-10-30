//
//  HomePageTableViewCell.swift
//  SampleTest
//
//  Created by Spandana Nayakanti on 6/21/19.
//  Copyright © 2019 Spandana. All rights reserved.
//

import UIKit

class HomePageTableViewCell: UITableViewCell {
   
    @IBOutlet var firstName: UILabel!
    @IBOutlet var lastName: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func loadNib() {
        Bundle.main.loadNibNamed("HomePageTableViewCell", owner: self, options: nil)
    }
}
