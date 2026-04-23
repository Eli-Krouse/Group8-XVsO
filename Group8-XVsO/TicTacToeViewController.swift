//
//  TicTacToeViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class TicTacToeViewController: BaseViewController {
    
    @IBOutlet weak var playerONameLabel: UILabel!
    
    @IBOutlet weak var playerXNameLabel: UILabel!
    
    @IBOutlet var BGGradientView: GradientView!
    
    
    @IBOutlet var xPts: [UIImageView]!
    
    @IBOutlet var oPts: [UIImageView]!
    
    @IBOutlet weak var gamePointOLabel: UILabel!
    
    @IBOutlet weak var gamePointXLabel: UILabel!

    
    @IBOutlet var board: [UIButton]!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    var xMiniPts = 0
    var oMiniPts = 0
    
    let winCondition = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var currentPlayer: Player = .x
    
    var titleBoard = ["", "", "", "", "", "", "", "", ""]
    
    @IBAction func TTTBoardTapped(_ sender: Any)
    {
        
        guard let button = sender as? UIButton else
        {
            return
        }
        let index = button.tag
        
        // update matrix
        titleBoard[index] = currentPlayer.rawValue
        print(titleBoard)
        
        // update UI
        button.setTitle(currentPlayer.rawValue, for: .normal)
        button.backgroundColor = currentPlayer.color

        // check win
        if(didWinMinigame(for: currentPlayer.rawValue))
        {
            switch(currentPlayer.rawValue)
            {
                case "X":
                    xMiniPts += 1
                case "O":
                    oMiniPts += 1
                default:
                    return
            }
            updateGameVisualization(for: currentPlayer.rawValue)
            waitTime(0.5)
            {
                self.reset()
                self.didWinGame()
            }
            return
        }
        
        button.isUserInteractionEnabled = false
        // switch player
        currentPlayer = (currentPlayer == .x) ? .o : .x

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
        settingsButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingsButton.tintColor = .gray
        gamePointOLabel.text = String(gamesManager.shared.oGamePts)
        gamePointXLabel.text = String(gamesManager.shared.xGamePts)
        
        reset()
    }
    

    func didWinMinigame(for player: String) -> Bool
    {
        for condition in winCondition
        {
            if(condition.allSatisfy({titleBoard[$0] == player}))
            {
                return true
            }
        }
        return false
    }

    func didWinGame()
    {
        if(xMiniPts == 2)
        {
            gamesManager.shared.xGamePts += 1
            gamePointXLabel.text = String(gamesManager.shared.xGamePts)
        }else if(oMiniPts == 2)
        {
            gamesManager.shared.oGamePts += 1
            gamePointXLabel.text = String(gamesManager.shared.oGamePts)

        }else
        {
            return
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Dots N Boxes") as! DotsNBoxesViewController
        
        navigationController?.setViewControllers([vc], animated: false)
        
    }
    
    func reset()
    {
        for button in board
        {
            button.setTitle("", for: .normal)
            button.isUserInteractionEnabled = true
            button.backgroundColor = .gray
            button.configuration = nil
        }
        titleBoard = Array(repeating: "", count: 9)
        currentPlayer = .x
    }
    
    func updateGameVisualization(for player: String)
    {
        let visIndex = xMiniPts + oMiniPts - 1
        switch(player)
        {
            case "X":
            xPts[visIndex].image = UIImage(systemName: "checkmark")
            xPts[visIndex].tintColor = .green
            oPts[visIndex].image = UIImage(systemName: "xmark")
            oPts[visIndex].tintColor = .red
        case "O":
            oPts[visIndex].image = UIImage(systemName: "checkmark")
            oPts[visIndex].tintColor = .green
            xPts[visIndex].image = UIImage(systemName: "xmark")
            xPts[visIndex].tintColor = .red
        default:
           return
        }
    }
    
    override func applyGradient() {
        BGGradientView.updateColors()
        playerXNameLabel.textColor = gamesManager.shared.xColor
        playerONameLabel.textColor = gamesManager.shared.oColor
        

        for (index, button) in board.enumerated()
        {
           switch(titleBoard[index])
            {
           case "X":
               button.backgroundColor = gamesManager.shared.xColor
           case "O":
               button.backgroundColor = gamesManager.shared.oColor
           default:
               button.backgroundColor = .gray
           }

        }
    }

}


