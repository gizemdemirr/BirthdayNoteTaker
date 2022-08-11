//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by Gizem on 10.06.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField1: UITextField!
    
    
    @IBOutlet weak var textField2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // app açılınca ilk çağırılan fonksiyon
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
//        casting - as? vs. as!
//        yapabilirsen storedName i stringe çevir, ünlem olursa storedname i kesin string olarak çevir
//        nameLabel.text = storedName as? String
//        mantıklı yolu bu şekilde kontrol etmek
        if let newName = storedName as? String {
            nameLabel.text = "Name : \(newName)"
        }
        if let newBirthday = storedBirthday as? String {
            birthdayLabel.text = "Birthday: \(newBirthday)"
        }
    }

//textfieldden girilen değeri labele bastırmak
    @IBAction func saveButton(_ sender: Any) {
//        app kapandığında verileri saklamak için
    
        UserDefaults.standard.set(textField1.text!, forKey: "name")
        UserDefaults.standard.set(textField2.text!, forKey: "birthday")
        
        nameLabel.text = "Name: \(textField1.text!)"
        birthdayLabel.text = "Birthday: \(textField2.text!)"
        
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        
        let storedName = UserDefaults.standard.object(forKey: "name")
        let birthdayName = UserDefaults.standard.object(forKey: "birthday")
        
        //eğer boş değilse
        if (storedName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name : "
        }
        if (birthdayName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday: "
//            sildikten sonra labeli boşa çek
        }
        
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
}

