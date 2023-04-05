//
//  DetailViewController.swift
//  DummyJsonUserApi
//
//  Created by Mac on 05/04/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var company: UILabel!
    
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        name .text = user!.firstName + " " + user!.maidenName + " " + user!.lastName
        email.text = user!.email
        address.text = user!.macAddress
        company.text = user!.birthDate
        
        let urlstring = user!.image

        let url = URL(string: urlstring)
        img.sd_setImage(with: url)
        
    }
    

}
