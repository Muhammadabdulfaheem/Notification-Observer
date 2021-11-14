//
//  ViewController.swift
//  Notifcation-Observer2
//
//  Created by MAC on 03/08/2021.
//

import UIKit

let lightNoifticationKey = "co.seanlena.lightSide"
let darkNoifticationKey = "co.seanlena.darkSide"


class ViewController: UIViewController{

    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var lblGame: UILabel!
    @IBOutlet weak var choiceBtn: UIButton!
    
    let light = Notification.Name(rawValue: lightNoifticationKey)
    let dark = Notification.Name(rawValue: darkNoifticationKey)
    deinit {
        /*
         remove observer wehn it is no need its good practise
         */
        NotificationCenter.default.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        choiceBtn.layer.cornerRadius = choiceBtn.frame.size.height/2
        createObserver()
    }

    func createObserver(){
     //   NotificationCenter.default.addObserver(self, selector: #selector(self.updateUI(_:)), name: Notification.Name("updateUI"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateData(_:)), name: Notification.Name("updateData"), object: nil)
        
        
        //Ligt
        
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateCharacterImage(notification:)), name: light, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateNameLabel(notification:)), name: light, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: light, object: nil)
//        
//        //Dark
//
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateCharacterImage(notification:)), name: dark, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateNameLabel(notification:)), name: dark, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.updateBackground(notification:)), name: dark, object: nil)
    }
    
    
    @objc func updateData(_ notification: NSNotification){

       // self.lblGame.text = notification.name   //generating an errro
        guard let userInfo = notification.userInfo else {print("data not found"); return}
        self.gameImage.image = userInfo["image"] as? UIImage
        self.lblGame.text = userInfo["name"] as? String
        self.view.backgroundColor = userInfo["color"] as? UIColor
    }
    
    @objc func updateUI(_ notification:NSNotification) {
        guard let userInfo = notification.userInfo else {print("update UI Data not found!");return}
        self.gameImage.image = userInfo["image"] as? UIImage
        self.lblGame.text = userInfo["name"] as? String
        self.view.backgroundColor = userInfo["color"] as? UIColor
        
        if let scores = notification.object as? [Int]{ // for getting the array
            print(scores)
        }
    }

    @IBAction func choiceBtn(_ sender: UIButton) {
        
        guard let SelectionVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: SelectionViewController.self)) as? SelectionViewController else {return}
      //  SelectionVC.delegateData = self
        self.navigationController?.pushViewController(SelectionVC, animated: true)
    }
}


    /*
    @objc func updateCharacterImage(notification: NSNotification){
        let isLight = notification.name == light
        if isLight{
            gameImage.image = UIImage(named: "luke")
        }
        else{
            gameImage.image = UIImage(named: "vader")
        }
    }
    
    @objc func updateNameLabel(notification: NSNotification){
        let isLight = notification.name == light
        if isLight{
            lblGame.text = "faheem"
        }
        else{
            lblGame.text = "Osama"
        }
        
    }
    @objc func updateBackground(notification: NSNotification){
        if let scores = notification.object as? [Int] {
            print(scores)
        }
        if let dict = notification.userInfo {
            print(dict["name"])
        }
        let isLigt = notification.name == light
        if isLigt{
            view.backgroundColor = UIColor.red
        }
        else {
            view.backgroundColor = UIColor.cyan
        }
    }*/
    

/*
extension ViewController: SlideSelectionDelegate{
    func didTapChoice(image: UIImage, name: String, color: UIColor) {
        gameImage.image = image
        lblGame.text = name
        view.backgroundColor = color
    }
    
  
}
*/
