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
       
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
         if let nav = self.navigationController {
                    nav.popViewController(animated: true)
                } else {
                    self.dismiss(animated: true, completion: nil)
                }
    }
    
   
}


