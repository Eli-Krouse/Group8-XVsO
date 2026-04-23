//
//  EndGameViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/22/26.
//

import UIKit

class EndGameViewController: BaseViewController
{
    
    @IBOutlet weak var playerXWinLabel: UILabel!
    
    @IBOutlet weak var playerOWinLabel: UILabel!
    
    @IBOutlet weak var replayButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func replayButtonTapped(_ sender: Any)
    {
        gamesManager.shared.currentRound = 1
        let vc = storyBoard.instantiateViewController(withIdentifier: "Tic Tac Toe") as! TicTacToeViewController
        
        navigationController?.setViewControllers([vc], animated: false)
        
        
    }
    
    @IBAction func stopButtonTapped(_ sender: Any)
    {
        gamesManager.shared.currentRound = 1
        let vc = storyBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()

        determineWinner()
    }
    
    func determineWinner()
    {
        if(gamesManager.shared.xGamePts>gamesManager.shared.oGamePts)
        {
            playerOWinLabel.text = "You lost..."
            playerXWinLabel.text = "You Won!"
        }else if(gamesManager.shared.xGamePts<gamesManager.shared.oGamePts)
        {
            playerOWinLabel.text = "You Won!"
            playerXWinLabel.text = "You lost..."
        }else
        {
            playerOWinLabel.text = "You Tied."
            playerXWinLabel.text = "You Tied."
        }
    }
    
    override func applyGradient()
    {
        playerOWinLabel.textColor = gamesManager.shared.oColor
        playerXWinLabel.textColor = gamesManager.shared.xColor
    }
}
