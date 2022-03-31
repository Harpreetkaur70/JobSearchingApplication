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
        
         self.searchField.addTarget(self, action: #selector(searchJob), for: .editingChanged);
        
        self.getJobList();
      
    }
    
        @objc func  searchJob(sender : UITextField) {
        
        self.filterJobArray.removeAll();
        let serachData : Int = self.searchField.text!.count;
        if(serachData != 0) {
            self.searching = true;
            for item in self.jobArray {
                if let itemToSearch = self.searchField.text {
                    let range = item.title.lowercased().range(of: itemToSearch, options: .caseInsensitive, range: nil, locale: nil);
                    if(range != nil) {
                        self.filterJobArray.append(item);
                    }
                }
             }
        } else {
            self.filterJobArray = self.jobArray;
            self.searching = false;
        }
        self.jobTableView.reloadData();
        
        
    }
    
    func getJobList()  {
        self.showSpinner();
        let url = "https://www.arbeitnow.com/api/job-board-api";
        var request = URLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "GET"
        request.timeoutInterval = 30.0
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
 
        AF.request(url, method: .get).responseJSON{ (myresponse) in
            
            switch myresponse.result{
           
            case .success:
                self.hideSpinner();
                let myresult = try? JSON(data: myresponse.data!);
                let respnseArray = myresult!["data"];
                if(respnseArray.count > 0) {
                    for i in respnseArray.arrayValue{
                        let jobModel = JobModel(slug: i["slug"].stringValue, companyName: i["company_name"].stringValue, title: i["title"].stringValue, description: i["description"].stringValue, remote: i["remote"].stringValue, url: i["url"].stringValue, location: i["location"].stringValue, createdAt: i["created_at"].stringValue)
                        self.jobArray.append(jobModel)
                       }
                    self.filterJobArray = self.jobArray;
                    
                    self.jobTableView.reloadData();
                }
                break;
                
            case .failure:
                self.hideSpinner();
                print("failu");
                break;
            }
        }
    }
    


    @IBAction func logoutBtn(_ sender: Any) {
       UserDefaults.standard.setValue(nil, forKey: "userName");
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true, completion:nil)
    }
    
  
    @IBAction func listBtnAction(_ sender: Any) {
       let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AppliedJobViewController") as! AppliedJobViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated:true, completion:nil)
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
         let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell", for: indexPath) as! JobTableViewCell
        cell.selectionStyle = .none
        let rowData = self.filterJobArray[indexPath.row];
        cell.titleLabel.text = rowData.title;
        cell.nameLabel.text = rowData.companyName + ", " + rowData.location;
        cell.slugLabel.text = rowData.slug;
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "JobDetailViewController") as! JobDetailViewController
        vc.modalPresentationStyle = .fullScreen
        vc.jobModel = self.filterJobArray[indexPath.row];
        self.present(vc, animated:true, completion:nil)
    }
    
   

}
