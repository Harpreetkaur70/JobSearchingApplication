//
//  RegisterViewController.swift
//  JobApp
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.userImage.layer.cornerRadius = 40;
        self.registerBtn.layer.cornerRadius = 15;
    }

    @IBAction func registerBtnAction(_ sender: Any) {
       
        
    }
    
    @IBAction func editBtnAction(_ sender: Any) {
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
       
    }
    
   
}

