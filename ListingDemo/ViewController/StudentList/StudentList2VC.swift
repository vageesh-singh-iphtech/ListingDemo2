//
//  StudentList2VC.swift
//  ListingDemo
//
//  Created by iPHTech 35 on 03/03/25.
//

import UIKit

class StudentList2VC: UIViewController, UITextViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var tblCollectionView: UICollectionView!
    var arrStudentList :[[String:String]] =  [[String:String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        studentList()
        tblCollectionView.delegate = self
        tblCollectionView.dataSource = self
    }
    // MARK: - Navigation
    
    
    func studentList(){
        
        arrStudentList =  UserDefaults.standard.value(forKey:"keyStudentList") as? [[String:String]] ?? []
       
         
        /*
        arrStudentList = [
                           [
                            "name" : "Sujoy Bose",
                            "rollNo" : "Reg3001",
                            "Dept" :   "IT",
                            "Address" :   "Kolkta"
                           ],
                           [
                            "name" : "Ajoy Nandi",
                            "rollNo" : "Reg5001",
                            "Dept" : "CSE",
                            "Address" : "Lucknow"
                           ],
                           [
                            "name" : "Subham Saha",
                            "rollNo" : "Reg6001",
                            "Dept" : "ECE",
                            "Address" : "Delhi"
                           ],
                           [
                            "name" : "Manas Mukherjee",
                            "rollNo" : "Reg6001",
                            "Dept" : "IT",
                            "Address" : "Mumbai"
                           ]
                   
                        ]
        
         */
    }
    
    // MARK:  UITableViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"CustCellStu", for: indexPath) as? CustCellStu else { return UICollectionViewCell() }
        
      
        cell.lblname.text =  self.arrStudentList[indexPath.row]["name"]
        cell.lblroll.text =  self.arrStudentList[indexPath.row]["rollNo"]
        cell.lbldept.text =  self.arrStudentList[indexPath.row]["Dept"]
        cell.lbladdress.text =  self.arrStudentList[indexPath.row]["Address"]
        
       // cell.selectionStyle = .none
        return cell
    }
  /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let padding:CGFloat = 10
        let collectionviewsize = collectionView.frame.width-padding
        
        let width = collectionviewsize/2-padding
        let height:CGFloat = 150
        return CGSize(width: width, height: height)
    } */
}
