//
//  GeneralSettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/22/26.
//

import UIKit

class GeneralSettingsViewController: BaseViewController
{
    
    @IBOutlet weak var roundTextField: UITextField!
    
    
    @IBOutlet weak var endGameButton: UIButton!
    
    @IBAction func roundStepper(_ sender: UIStepper)
    {
        roundTextField.text = "\(Int(sender.value))"
        gamesManager.shared.maxRounds = Int(sender.value)
    }
    
    @IBAction func endGameTapped(_ sender: Any)
    {
        let alert = UIAlertController(title: "End Game", message: "Are you Sure you want to end the game?", preferredStyle: .alert)
        let noAction = UIAlertAction(title: "no", style: .default)
        let yesAction = UIAlertAction(title: "yes", style: .default) {_ in
            let vc = self.storyBoard.instantiateViewController(withIdentifier: "End Game") as! EndGameViewController
            
            self.navigationController?.setViewControllers([vc], animated: false)
        }
        alert.addAction(noAction)
        alert.addAction(yesAction)
        present(alert, animated: true)
    }
    
    

    

    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        endGameButton.tintColor = .red
    }
}
