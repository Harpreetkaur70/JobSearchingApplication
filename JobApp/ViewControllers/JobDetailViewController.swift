//
//  JobDetailViewController.swift
//  JobApp
//
//

import UIKit

class JobDetailViewController: UIViewController {


    @IBOutlet weak var applyBtn: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var slugLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    var jobModel = JobModel(slug: "", companyName: "", title: "", description: "", remote: "", url: "", location: "", createdAt: "");
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.applyBtn.layer.cornerRadius = 15;
        self.applyBtn.layer.cornerRadius = 15;
        self.titleLbl.text = self.jobModel.title;
        self.nameLbl.text = self.jobModel.companyName + ", " + self.jobModel.location;
        self.slugLbl.text = self.jobModel.slug;
        self.descriptionLbl.attributedText = self.jobModel.description.htmlToAttributedString
        
    }
    
    @IBAction func applyBtnAction(_ sender: Any) {
       let dict = ["title":self.titleLbl.text,"name":self.nameLbl.text,"slug":self.slugLbl.text,"desc":self.descriptionLbl.text];
        DatabaseHelper.shareInstance.saveJob(object: dict as! [String:String]);
        self.showAlert(message1: "Successfully apply for this job", key: "");
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
    
    @IBAction func backBtnAction(_ sender: Any) {
         if let nav = self.navigationController {
                    nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
    
    
   
}
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}


