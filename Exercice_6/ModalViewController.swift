//
//  ModalViewController.swift
//  Exercice_6
//
//  Created by Damien Nivault on 23/01/2018.
//  Copyright © 2018 Damien Nivault. All rights reserved.
//

import Foundation
import UIKit

class ModalViewController: UIViewController {
    @IBOutlet weak var outletClose: UIButton!
    @IBAction func closeButton(_ sender: Any) {
        self.performSegue(withIdentifier: "closeModal", sender: person)
    }
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var dflkerngoer: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    var person: Person!
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        person.show()

            self.firstnameLabel.text = person.firstname
            self.dflkerngoer.text = person.lastname
            self.gender.text = person.gender.rawValue
            self.email.text = person.email.description
            self.birthdate.text = person.birthdate.toString(format: "dd-MM-yyyy")
            let url = URL(string: person.picture)
        
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        self.userImage.image = UIImage(data: data!)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        outletClose.layer.cornerRadius = 4
        
    }
    
}
