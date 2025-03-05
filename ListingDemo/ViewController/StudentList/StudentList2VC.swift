//
//  StudentList2VC.swift
//  ListingDemo
//
//  Created by iPHTech 35 on 03/03/25.
//

import UIKit

class StudentList2VC: UIViewController, UITextViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var tblCollectionView: UICollectionView!
    var arrStudentList :[[String:String]] =  [[String:String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        studentList()
        tblCollectionView.register(UINib(nibName: "CustCellStu", bundle: nil), forCellWithReuseIdentifier: "CustCellStu")
        tblCollectionView.delegate = self
        tblCollectionView.dataSource = self
    }
    // MARK: - Navigation
    
    func studentList(){
        
        arrStudentList =  UserDefaults.standard.value(forKey:"keyStudentList") as? [[String:String]] ?? []
    }
    
    // MARK:  UITableViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrStudentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustCellStu", for: indexPath) as? CustCellStu else {
            return UICollectionViewCell()
        }

        // Check if indexPath.row is within the bounds of arrStudentList
        if indexPath.row < arrStudentList.count {
            cell.lblname.text = arrStudentList[indexPath.row]["name"]
            cell.lblroll.text = arrStudentList[indexPath.row]["rollNo"]
            cell.lbldept.text = arrStudentList[indexPath.row]["Dept"]
            cell.lbladdress.text = arrStudentList[indexPath.row]["Address"]
        } else {
            // Handle case where the data is not available for the index
            cell.lblname.text = "N/A"
            cell.lblroll.text = "N/A"
            cell.lbldept.text = "N/A"
            cell.lbladdress.text = "N/A"
        }

        return cell
    }

  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let padding:CGFloat = 10
        let collectionviewsize = collectionView.frame.width - padding
        
        let width = collectionviewsize / 2 - padding
        let height:CGFloat = 150
        return CGSize(width: width, height: height)
    }
}
