//
//  LoginViewController.swift
//  JobApp
//
//
import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.loginBtn.layer.cornerRadius = 15;
        self.registerBtn.layer.cornerRadius = 15;
        
    }

    @IBAction func registerBtnAction(_ sender: Any) {
     
    }
    @IBAction func loginBtnAction(_ sender: Any) {
        
    }
    
}

