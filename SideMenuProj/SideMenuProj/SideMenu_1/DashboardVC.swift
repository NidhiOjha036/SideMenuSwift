//
//  DashboardVC.swift
//  SideMenuProj
//
//  Created by Nidhi on 25/02/24.
//

import UIKit

class DashboardVC: UIViewController,UITableViewDelegate, UITableViewDataSource, HamburgerViewControllerDelegate{
    
    @IBOutlet weak var mainBackView: UIView!
    @IBOutlet weak var hamburgerView: UIView!
    @IBOutlet weak var leadingConstraintForHamburgerView: NSLayoutConstraint!
    @IBOutlet weak var backViewForHamburger: UIView!
    var hamburgerViewController : HamburgerVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.backViewForHamburger.isHidden = true
        self.mainBackView.layer.cornerRadius = 40
        self.mainBackView.clipsToBounds = true
    }

    @IBAction func tappedOnHamburgerbackView(_ sender: Any) {
        self.hideHamburgerView()
    }
    
    func hideHamburgerMenu() {
        self.hideHamburgerView()
    }
    
    private func hideHamburgerView()
    {
        UIView.animate(withDuration: 0.2) {
            self.leadingConstraintForHamburgerView.constant = 10
            self.view.layoutIfNeeded()
            
        } completion: { status in
            UIView.animate(withDuration: 0.2) {
                self.leadingConstraintForHamburgerView.constant = -280
                self.view.layoutIfNeeded()
                
            } completion: { status in
                self.backViewForHamburger.isHidden = true
            }
            
        }
        
    }
    
    
    @IBAction func showHamburgerMenu(_ sender: Any) {
        
        UIView.animate(withDuration: 0.2) {
            self.leadingConstraintForHamburgerView.constant = 10
            self.view.layoutIfNeeded()
        } completion: { status in
            UIView.animate(withDuration: 0.2) {
                self.leadingConstraintForHamburgerView.constant = -10
                self.view.layoutIfNeeded()
            } completion: { status in
                self.backViewForHamburger.isHidden = false
            }
        }
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "hamburgerSegue")
        {
            if let controller = segue.destination as? HamburgerVC
            {
                self.hamburgerViewController = controller
                self.hamburgerViewController?.delegate = self
            }
        }
    }
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as! MovieTableViewCell
        
        cell.selectionStyle = .none
        
        cell.backView.layer.cornerRadius = 8
        cell.backView.clipsToBounds = true
        
        cell.profilePicImage.layer.cornerRadius = 25
        cell.profilePicImage.clipsToBounds = true
        
        return cell
    }
    

}
