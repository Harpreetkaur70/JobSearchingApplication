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
        if(userNameField.text == "") {
            self.showAlert(message1: "Please enter username", key: "");
        } else if(passwordField.text == "") {
            self.showAlert(message1: "Please enter username", key: "");
        } else if(phoneField.text == "") {
            self.showAlert(message1: "Please enter mobile number", key: "");
        } else {
             let dict = ["userName":userNameField.text,"password":passwordField.text,"mobile":phoneField.text];
            DatabaseHelper.shareInstance.save(object: dict as! [String:String]);
            self.showAlert(message1: "Register Successfully", key: "exit");
        }
        
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
         if let nav = self.navigationController {
                    nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
    func showAlert(message1 : String, key : String) {
        
        let alert = UIAlertController(title: "Alert", message: message1, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                    if(key == "exit") {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated:true, completion:nil)
                    }
                    
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
   
}

