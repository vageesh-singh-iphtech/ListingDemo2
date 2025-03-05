//
//  WelcomeVC.swift
//  ListingDemo
//
//  Created by iPHTech 35 on 25/02/25.
//

import UIKit

class WelcomeVC: UIViewController {
    
    let names = ["nick","mike","dave","john","vageesh","rohan","shivam","saurabh","priyanshu","utkarsh"]
    
    let digi = [0:"zero",1:"one",2:"two",3:"three",4:"four",5:"five",6:"six",7:"seven",8:"eight",9:"nine"]
    
    let numbers = [10, 666, 7890, 8899667733]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var revNames = names.sorted(by: backword)
        
        print(revNames)
        
        let revname = names.sorted(by: {s1,s2 in s1>s2})
        print(revname)
        
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            
        repeat{
                output = digi[number % 10]! + output
                number /= 10
        }while number > 0
                return output
        }
        print(strings)
        
        /*
        sayHelloLater(name: ", its Alexander, IOS Developer "){
            if(is)
            print("the closure is called successfully")
            print("the result will be printed in 5 seconds")
        }*/
        
        sayHelloLater(name:"Rajat") { isSucess in
            if(isSucess){
                print("the closure is called successfully")
                print("the result will be printed in 5 seconds")
            }
        }
       // sayHelloLater2(name: "dave")
    }
    
    
    // MARK: - Navigation
    
    func backword(_ s1:String, _ s2:String) -> Bool{
        return s1<s2
    }
    
//    func loadPicture(from server: Server, completion: (Picture) -> Void, onfailure: () -> Void){
//        if let picture = download("photo.jpg", from server){
//            completion(picture)
//        }else{
//            onfailure()
//        }
//    }
    
    func sayHelloLater(name: String, completion: @escaping (Bool) -> Void){
        
        print("hi\(name)")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
           completion(true)
        }
        
        print("Last Part Of Function")
    }
    
    func sayHelloLater2(name: String){
        
        print("hi\(name)")
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5){
          
        }
        
        print("Last Part Of Function 2")
    }
}
