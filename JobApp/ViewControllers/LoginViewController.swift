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
     let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true, completion:nil)
    }
    @IBAction func loginBtnAction(_ sender: Any) {
        if(self.userNameField.text == "") {
            self.showAlert(message1: "Please enter username", key: "");
        } else if(self.passwordField.text == "" ){
            self.showAlert(message1: "Please enter password", key: "");
        } else {
            
        }

    }
    
    func showAlert(message1 : String, key : String) {
        
        let alert = UIAlertController(title: "Alert", message: message1, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                    if(key == "exit") {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let vc = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
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

