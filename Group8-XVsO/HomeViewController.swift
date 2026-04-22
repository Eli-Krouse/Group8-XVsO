//
//  ViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class HomeViewController: UIViewController
{
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var xTitleLabel: UILabel!
    
    @IBOutlet weak var oTitleLabel: UILabel!
    
    
    @IBAction func playButtonTapped(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
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
        
        xTitleLabel.textColor = gamesManager.shared.xColor
        oTitleLabel.textColor = gamesManager.shared.oColor
    }
}

class gamesManager
{
    static let shared = gamesManager()
    
    private init() {}
    
    var xColor: UIColor = .red

    var oColor: UIColor = .blue
    
    var xGamePts = 0
    var oGamePts = 0
    
    var maxRounds = 1
    var currentRound = 1
}

extension NSNotification.Name
{
    static let updatedGradient = NSNotification.Name("updatedGradient")
}
