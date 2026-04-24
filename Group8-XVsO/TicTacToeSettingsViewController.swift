//
//  TicTacToeSettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/23/26.
//

import UIKit

class TicTacToeSettingsViewController: BaseViewController {

    //beta/presentation curtosy button
    @IBAction func goToTicTacToeTapped(_ sender: Any)
    {
        let vc = self.storyBoard.instantiateViewController(withIdentifier: "Tic Tac Toe") as! TicTacToeViewController
        
        self.navigationController?.setViewControllers([vc], animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
