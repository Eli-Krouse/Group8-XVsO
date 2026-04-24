//
//  ViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class HomeViewController: BaseViewController
{
    @IBOutlet var BGGradientView: GradientView!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var xTitleLabel: UILabel!
    
    @IBOutlet weak var oTitleLabel: UILabel!
    
    //sends you to TicTacToe. Replaces this ViewContorller into the navigationController's root ViewController
    @IBAction func playButtonTapped(_ sender: Any)
    {
        let vc = storyBoard.instantiateViewController(withIdentifier: "Tic Tac Toe") as! TicTacToeViewController
        
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNeedsStatusBarAppearanceUpdate()
        settingsButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingsButton.tintColor = .gray
    }
    
    override func applyGradient() {
        BGGradientView.updateColors()
        xTitleLabel.textColor = GamesManager.shared.xColor
        oTitleLabel.textColor = GamesManager.shared.oColor
    }
}


