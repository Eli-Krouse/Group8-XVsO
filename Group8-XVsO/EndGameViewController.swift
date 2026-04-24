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
    
    //resets current round and sends you to TicTacToe to replay
    @IBAction func replayButtonTapped(_ sender: Any)
    {
        gameMangReset()
        let vc = storyBoard.instantiateViewController(withIdentifier: "Tic Tac Toe") as! TicTacToeViewController
        
        navigationController?.setViewControllers([vc], animated: true)
        
        
    }
    
    //sends you to home screen, but still resets in case you play again
    @IBAction func stopButtonTapped(_ sender: Any)
    {
        gameMangReset()
        let vc = storyBoard.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    //resets game points and current round
    func gameMangReset()
    {
        GamesManager.shared.currentRound = 1
        GamesManager.shared.xGamePts = 0
        GamesManager.shared.oGamePts = 0
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()

        determineWinner()
    }
    
    //Applies correct text when the view controller loads in
    func determineWinner()
    {
        if(GamesManager.shared.xGamePts>GamesManager.shared.oGamePts)
        {
            playerOWinLabel.text = "You lost..."
            playerXWinLabel.text = "You Won!"
        }else if(GamesManager.shared.xGamePts<GamesManager.shared.oGamePts)
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
        playerOWinLabel.textColor = GamesManager.shared.oColor
        playerXWinLabel.textColor = GamesManager.shared.xColor
    }
}
