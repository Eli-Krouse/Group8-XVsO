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
}
