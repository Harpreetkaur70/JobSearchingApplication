//
//  HomeViewController.swift
//  JobApp
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
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
        self.jobTableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        let cellNib = UINib.init(nibName: "JobTableViewCell", bundle: Bundle.main)
        self.jobTableView.register(cellNib, forCellReuseIdentifier: "JobTableViewCell")
        
        self.jobTableView.dataSource = self;
        self.jobTableView.delegate = self;
      
    }
    


    @IBAction func logoutBtn(_ sender: Any) {
      
    }
    
  
    @IBAction func listBtnAction(_ sender: Any) {
      
    }
    
    // MARK:- --------- UITableView Delegates and Datasource ---------
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150;
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.filterJobArray.count;
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
    }
    
   

}
