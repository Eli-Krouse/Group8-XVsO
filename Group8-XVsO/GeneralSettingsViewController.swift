//
//  GeneralSettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/22/26.
//

import UIKit

class GeneralSettingsViewController: UIViewController
{
    
    @IBOutlet weak var roundTextField: UITextField!
    
    @IBAction func roundStepper(_ sender: UIStepper)
    {
        roundTextField.text = "\(Int(sender.value))"
        gamesManager.shared.maxRounds = Int(sender.value)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
