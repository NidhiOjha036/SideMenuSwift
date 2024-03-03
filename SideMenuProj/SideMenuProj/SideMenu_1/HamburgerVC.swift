//
//  HamburgerVC.swift
//  SideMenuProj
//
//  Created by Nidhi on 25/02/24.
//

import UIKit

protocol HamburgerViewControllerDelegate {
    func hideHamburgerMenu()
}

class HamburgerVC: UIViewController {
    
    @IBOutlet weak var mainBackgroundView: UIView!
    @IBOutlet weak var profilePicImg: UIImageView!
    
    
    var delegate : HamburgerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpHamburger()

    }
    
    
    private func setUpHamburger() {
        
        self.mainBackgroundView.layer.cornerRadius = 5
        self.mainBackgroundView.clipsToBounds = true
        self.profilePicImg.layer.cornerRadius = 40
        self.profilePicImg.clipsToBounds = true
        
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
        
        self.delegate?.hideHamburgerMenu()

        
    }
    
    

}
