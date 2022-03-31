//
//  HomeViewController.swift
//  JobApp
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchViewHeight: NSLayoutConstraint!
    @IBOutlet weak var jobTableView: UITableView!
    var jobArray = [JobModel]();
    var filterJobArray = [JobModel]();
    var searching : Bool = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
      
    }
    


    @IBAction func logoutBtn(_ sender: Any) {
      
    }
    
  
    @IBAction func listBtnAction(_ sender: Any) {
      
    }
    
   

}
