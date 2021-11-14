//
//  SelectionViewController.swift
//  Notifcation-Observer2
//
//  Created by MAC on 03/08/2021.
//

import UIKit

protocol SlideChaingDelegate {
    func didTapChoice(image:UIImage,name:String,color:UIColor)
}
/*
protocol SlideSelectionDelegate {
    func didTapChoice(image: UIImage,name: String,color:UIColor)
}
 */
class SelectionViewController: UIViewController {

    var scores = [34,45,56,6767,56]
  //  var delegegateData : SlideChaingDelegate?
    
  //delegate and protcol  var delegateData: SlideSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func imperialBtn(_ sender: UIButton) {
        let data: [String:Any] = [
            "color" : UIColor.cyan,
            "name" : "faheem",
            "image": #imageLiteral(resourceName: "luke")
        ]
        let name = "faheem"
        NotificationCenter.default.post(name: Notification.Name("updateData"), object: name)//sending the name here
        NotificationCenter.default.post(name: Notification.Name("updateData"), object: nil , userInfo: data) //why objec nil
        NotificationCenter.default.post(name: Notification.Name("updateData"), object: scores)
        self.navigationController? .popViewController(animated: true)
      
        
        
//        let name = Notification.Name(rawValue:darkNoifticationKey)
//        NotificationCenter.default.post(name: name, object: scores) //object is nil you can pass any info here
//        let dictionary :[String:String] = ["name":"Ali"]
      //  NotificationCenter.default.post(name: Notification.Name("updateUI"), object: nil, userInfo: data)
            //self.navigationController?.popViewController(animated: true)
        
        //delegate and protcol delegateData?.didTapChoice(image: UIImage(named: "vader")!, name: "faheem", color: .red)
       // dismiss(animated: true, completion: nil)
        
        //delegegateData?.didTapChoice(image: UIImage(named: "vender")!, name: "kaleem", color: .gray)
    }
    

    @IBAction func rebelBtn(_ sender: UIButton) {
       
        let data :[String: Any] = [
            "color" : UIColor.red,
            "name" : "kaleem",
            "image" :  #imageLiteral(resourceName: "vader")
        ]
      
        NotificationCenter.default.post(name: Notification.Name("updateData"), object: nil, userInfo: data)
        // NotificationCenter.default.post(name: Notification.Name("updateUI"), object: nil, userInfo: data)
//        let name = Notification.Name(rawValue: lightNoifticationKey)
//        NotificationCenter.default.post(name: name, object: nil)
        self.navigationController?.popViewController(animated: true)
        //delegateData?.didTapChoice(image: UIImage(named:"luke" )!, name: "Luke", color: .gray)
        //dismiss(animated: true, completion: nil)
        
        //delegegateData?.didTapChoice(image: UIImage(named: "luke")!, name: "rehan", color: .green)
    }
}
