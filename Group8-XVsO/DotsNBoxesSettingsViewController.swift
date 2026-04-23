//
//  DotsNBoxesSettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/23/26.
//

import UIKit

class DotsNBoxesSettingsViewController: BaseViewController {

  
    @IBAction func goToDotsNBoxesTapped(_ sender: Any)
    {
        let vc = self.storyBoard.instantiateViewController(withIdentifier: "Dots N Boxes") as! DotsNBoxesViewController
        
        self.navigationController?.setViewControllers([vc], animated: false)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
