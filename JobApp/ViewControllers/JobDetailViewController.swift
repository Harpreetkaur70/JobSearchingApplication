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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.applyBtn.layer.cornerRadius = 15;
       
        
    }
    
    @IBAction func applyBtnAction(_ sender: Any) {
       
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
       
    }
    
   
}


