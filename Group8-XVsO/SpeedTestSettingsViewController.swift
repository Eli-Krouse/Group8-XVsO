//
//  SpeedTestSettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/23/26.
//

import UIKit

class SpeedTestSettingsViewController: BaseViewController {

    

    @IBAction func goToSpeedTestTapped(_ sender: Any)
    {
        let vc = self.storyBoard.instantiateViewController(withIdentifier: "Speed Test") as! SpeedTestViewController
        
        self.navigationController?.setViewControllers([vc], animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
