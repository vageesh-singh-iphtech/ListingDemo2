//
//  CustCellStu.swift
//  ListingDemo
//
//  Created by iPHTech 35 on 03/03/25.
//

import UIKit

class CustCellStu: UICollectionViewCell {
    
    @IBOutlet weak var viewContent: UIView!
    
    
    @IBOutlet weak var lblname: UILabel!
    
    @IBOutlet weak var lblroll: UILabel!
    @IBOutlet weak var lbldept: UILabel!
    
    @IBOutlet weak var lbladdress: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
      
        viewContent.layer.cornerRadius  = 5
        viewContent.layer.borderColor = UIColor.black.cgColor
        viewContent.layer.borderWidth = 3
        viewContent.layer.masksToBounds = true
       
        
    //    btnRefEdit.layer.cornerRadius = 5
  //      btnRefDelete.layer.cornerRadius = 5
        
    }
}
