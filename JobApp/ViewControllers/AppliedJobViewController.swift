//
//  AppliedJobViewController.swift
//  JobApp
//

import UIKit

class AppliedJobViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var jobTableView: UITableView
     var jobArray = [Jobs]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       self.jobTableView.separatorStyle = UITableViewCell.SeparatorStyle.none;
        let cellNib = UINib.init(nibName: "JobTableViewCell", bundle: Bundle.main)
        self.jobTableView.register(cellNib, forCellReuseIdentifier: "JobTableViewCell")
        
        self.jobTableView.dataSource = self;
        self.jobTableView.delegate = self;
        
         self.jobArray = DatabaseHelper.shareInstance.getJobs();
        
        self.jobTableView.reloadData();
        
    }
    
    
    @IBAction func backBtnAction(_ sender: Any) {
      
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
        return self.jobArray.count;
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobTableViewCell", for: indexPath) as! JobTableViewCell
        cell.selectionStyle = .none
        let rowData = self.jobArray[indexPath.row];
        cell.titleLabel.text = rowData.title;
        cell.nameLabel.text = rowData.name;
        cell.slugLabel.text = rowData.slug;
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
       
    }
    
  
}
