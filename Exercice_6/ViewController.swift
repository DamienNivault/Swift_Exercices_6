//
//  ViewController.swift
//  Exercice_6
//
//  Created by Damien Nivault on 23/01/2018.
//  Copyright © 2018 Damien Nivault. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var manager = ApiManager()
    @IBAction func changeView(_ sender: UIButton) {
       
            DispatchQueue.main.async {
                if(UserDefaults.standard.value(forKey: "firstname") != nil) {
                   
                    let cachedFirstname = UserDefaults.standard.value(forKey: "firstname") as! String
                    let cachedLastname = UserDefaults.standard.value(forKey: "lastname") as! String
                    let cachedGender =  Person.Gender(rawValue: UserDefaults.standard.value(forKey: "gender") as! String)
                    let cachedEmail = UserDefaults.standard.value(forKey: "email") as! String
                    let cachedBirthdate = UserDefaults.standard.value(forKey: "birthdate") as! Date
                    let cachedPicture = UserDefaults.standard.value(forKey: "picture") as! String
                    let cachedPerson = Person(firstname: cachedFirstname, lastname: cachedLastname, gender: cachedGender!, email: cachedEmail,picture: cachedPicture, birthdate:cachedBirthdate)
                    self.performSegue(withIdentifier: "showPerson", sender: cachedPerson)
                } else {
                    self.manager.getRandomUserHydratedWithPerson(completion:  {  person in
                        UserDefaults.standard.set(person.firstname, forKey: "firstname")
                        UserDefaults.standard.set(person.lastname, forKey: "lastname")
                        UserDefaults.standard.set(person.gender.rawValue, forKey: "gender")
                        UserDefaults.standard.set(person.email.email, forKey: "email")
                        UserDefaults.standard.set(person.birthdate, forKey: "birthdate")
                        UserDefaults.standard.set(person.picture, forKey: "picture")
                        self.performSegue(withIdentifier: "showPerson", sender: person)
                })
                
                }
            }
            
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func clearCache(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "showPerson") {
            let controller = segue.destination as! ModalViewController
            controller.person = sender as! Person
        }
    }
}

