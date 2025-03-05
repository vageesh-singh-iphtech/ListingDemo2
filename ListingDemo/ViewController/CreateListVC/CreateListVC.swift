//
//  CreateListVC.swift
//  ListingDemo
//
//  Created by iPHTech 35 on 26/02/25.
//

import UIKit

class CreateListVC: UIViewController,UITextViewDelegate, UITextFieldDelegate {
    
    
    @IBOutlet weak var txtStudName: UITextField!
    @IBOutlet weak var txtStudtRollNo: UITextField!
    @IBOutlet weak var txtStudDept: UITextField!
    @IBOutlet weak var txtStudAddress: UITextField!
    
    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var btnRefSubmit: UIButton!
    
    
    var isEdit: Bool = false
    var selIndex = 0
    var studentInfo : [String:String] =  [String:String]()
    
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtStudName.layer.cornerRadius=20
        txtStudName.layer.borderWidth=2
        
        txtStudtRollNo.layer.cornerRadius=20
        txtStudtRollNo.layer.borderWidth=2
        
        txtStudDept.layer.cornerRadius=20
        txtStudDept.layer.borderWidth=2
        
        txtStudAddress.layer.cornerRadius=20
        txtStudAddress.layer.borderWidth=2
        
        txtStudName.delegate = self
        txtStudDept.delegate = self
        txtStudAddress.delegate = self
        txtStudtRollNo.delegate = self
        
        if(isEdit){
            lblHeader.text = "Edit Student"
            btnRefSubmit.setTitle("Edit", for: .normal)
            setStudentInfo()
        }else{
            lblHeader.text = "Add Student"
            btnRefSubmit.setTitle("Add", for: .normal)
            
        }

        
    }
    func setStudentInfo(){
        
        self.txtStudName.text =  self.studentInfo["name"]
        self.txtStudtRollNo.text =  self.studentInfo["rollNo"]
        self.txtStudDept.text =  self.studentInfo["Dept"]
        self.txtStudAddress.text =  self.studentInfo["Address"]
    }
    
    @IBAction func addEditFunc(_ sender: UIButton) {
        if(isEdit){
            editStudentFun()
        }else{
            addStudentFun()
        }
    }
    
    
    // MARK: - Navigation
    
    func addStudentFun(){
        var dictStudent : [String:String] = [String:String]()
        
        dictStudent = [
                         "name" : self.txtStudName.text ?? "" ,
                         "rollNo" : self.txtStudtRollNo.text ?? "",
                         "Dept" : self.txtStudDept.text ?? "",
                         "Address" : self.txtStudAddress.text ?? ""
                      ]
        
       var arrStudentList =  UserDefaults.standard.value(forKey:"keyStudentList") as? [[String:String]] ?? []
       arrStudentList.append(dictStudent)
        UserDefaults.standard.setValue(arrStudentList, forKey:"keyStudentList")
        
        self.txtStudName.text = ""
        self.txtStudtRollNo.text = ""
        self.txtStudDept.text = ""
        self.txtStudAddress.text = ""
        
    }
    
    
    func editStudentFun(){
        var dictStudent : [String:String] = [String:String]()
        
        dictStudent = [
                         "name" : self.txtStudName.text ?? "" ,
                         "rollNo" : self.txtStudtRollNo.text ?? "",
                         "Dept" : self.txtStudDept.text ?? "",
                         "Address" : self.txtStudAddress.text ?? ""
                      ]
        
        var arrStudentList =  UserDefaults.standard.value(forKey:"keyStudentList") as? [[String:String]] ?? []
        
// MARK:  double glitch fix
        
        if selIndex >= 0 && selIndex < arrStudentList.count {
            // Add bounds checking!
                arrStudentList[selIndex] = dictStudent
        } else {
            print("Error: selIndex out of bounds!")
            return
        }
        
        UserDefaults.standard.setValue(arrStudentList, forKey:"keyStudentList")
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentListVC") as! StudentListVC
         self.navigationController?.pushViewController(vc, animated: true)
        
    }

    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool{
       textField.resignFirstResponder()
        return true
    }
    
}
