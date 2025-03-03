//
//  StudentVC.swift
//  ListingDemo
//
//  Created by iPHTech 35 on 03/03/25.
//

import UIKit

class StudentVC: UIViewController {
    
    
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var rollno: UITextField!
    
    @IBOutlet weak var department: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var btnSubmit: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        name.layer.cornerRadius=20
        name.layer.borderWidth=2
        
        rollno.layer.cornerRadius = 20
        rollno.layer.borderWidth=2
        
        department.layer.cornerRadius = 20
        department.layer.borderWidth=2
        
        address.layer.cornerRadius = 20
        address.layer.borderWidth=2
        
      
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
