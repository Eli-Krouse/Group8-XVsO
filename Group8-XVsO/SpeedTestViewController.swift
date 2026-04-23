//
//  SpeedTestViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class SpeedTestViewController: BaseViewController {

    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet var BGGradientView: GradientView!
    
    @IBOutlet weak var playerONameLabel: UILabel!
    
    @IBOutlet weak var playerXNameLabel: UILabel!
    
    @IBOutlet weak var gamePointOLabel: UILabel!
    
    @IBOutlet weak var gamePointXLabel: UILabel!
    
    @IBOutlet weak var revealImage: UIImageView!
    
    
    @IBOutlet var xMinigamePoints: [UIImageView]!
    
    @IBOutlet var oMinigamePoints: [UIImageView]!
    
    var oMiniPts = 0
    var xMiniPts = 0
    
    @IBOutlet weak var o1: UIImageView!
    
    @IBOutlet weak var o2: UIImageView!
    
    @IBOutlet weak var o3: UIImageView!
    
    @IBOutlet weak var x1: UIImageView!
    
    @IBOutlet weak var x2: UIImageView!
    
    @IBOutlet weak var x3: UIImageView!
    
    
    @IBOutlet weak var oCircleButton: UIButton!
    
    @IBOutlet weak var oTriButton: UIButton!
    
    @IBOutlet weak var oSqrButton: UIButton!
    
    @IBOutlet weak var xCircleButton: UIButton!
    
    @IBOutlet weak var xTriButton: UIButton!
    
    @IBOutlet weak var xSqrButton: UIButton!
    
    
    @IBOutlet var oButtonCollection: [UIButton]!
    
    @IBOutlet var xButtonCollection: [UIButton]!
    
    
    lazy var xDict: [UIButton: UIImageView] = [xCircleButton: x1, xTriButton: x2, xSqrButton: x3]
    lazy var oDict: [UIButton: UIImageView] = [oCircleButton: o1, oTriButton: o2, oSqrButton: o3]
    
    
    
    @IBAction func oButtonTapped(_ sender: Any)
    {
        guard let button = sender as? UIButton else
        {
            return
        }
        buttonHandler(button, for: .o)
    }
    
    @IBAction func xButtonTapped(_ sender: Any)
    {
        guard let button = sender as? UIButton else
        {
            return
        }
        
        buttonHandler(button, for: .x)
    }
    
    func buttonHandler(_ button: UIButton, for player: Player)
    {
        let isCorrectGuess = isCorrect(button, for: player)

        
        if(isCorrectGuess)
        {
            makeUninteractable(for: .x)
            makeUninteractable(for: .o)
            
            giveMiniPoint(to: player)
            updateMinigamePointUI(for: player)
            updateButtonUI(button, for: player, with: .green)
            waitTime(2){
                self.reset()
            }
            
            if(didWinMiniGame(for: player))
            {
                checkGameEnding()
            }
            
        }else
        {
            makeUninteractable(for: player)
            updateButtonUI(button, for: player, with: .red)
        }

    }
    func isCorrect(_ button: UIButton, for player: Player) -> Bool
    {
  
        let correctGuessImage = revealImage.image
        
        switch(player)
        {
            case .x:
                switch(button)
                {
                    case xCircleButton:
                        return UIImage(systemName: "circle.fill") == correctGuessImage
                    case xTriButton:
                        return UIImage(systemName: "triangle.fill") == correctGuessImage
                    case xSqrButton:
                        return UIImage(systemName: "square.fill") == correctGuessImage
                    default:
                        break
                }
                
            case .o:
                switch(button)
                {
                    case oCircleButton:
                        return UIImage(systemName: "circle.fill") == correctGuessImage
                    case oTriButton:
                        return UIImage(systemName: "triangle.fill") == correctGuessImage
                    case oSqrButton:
                        return UIImage(systemName: "square.fill") == correctGuessImage
                    default:
                        break
                }
        }
        
        return false
    }
    
    func makeUninteractable(for player: Player)
    {
        let buttons: [UIButton]
        switch(player)
        {
        case .x:
            buttons = xButtonCollection
        case .o:
            buttons = oButtonCollection
        }
        
        for button in buttons
        {
            button.isUserInteractionEnabled = false
        }
    }
    
    func updateMinigamePointUI(for player: Player)
    {
        switch(player)
        {
        case .x:
            xMinigamePoints[self.xMiniPts-1].image = UIImage(systemName: "circleBadge.fill")
            xMinigamePoints[self.xMiniPts-1].tintColor = gamesManager.shared.xColor
        
        case .o:
            oMinigamePoints[self.oMiniPts-1].image = UIImage(systemName: "circleBadge.fill")
            oMinigamePoints[self.oMiniPts-1].tintColor = gamesManager.shared.oColor
        }
    }
    
    func updateButtonUI(_ button: UIButton, for player: Player, with color: UIColor)
    {
        guard let image = (player == .x ? xDict : oDict)[button] else
        {
            return
        }
        
        var systemImage: String
        switch(button)
        {
            case xCircleButton, oCircleButton:
                systemImage = "circle.fill"
            case xTriButton, oTriButton:
                systemImage = "triangle.fill"
            case xSqrButton, oSqrButton:
                systemImage = "square.fill"
            default:
                return
        }
        image.image = UIImage(systemName: systemImage)
        image.tintColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
        settingsButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingsButton.tintColor = .gray
        
        gamePointOLabel.text = String(gamesManager.shared.oGamePts)
        gamePointXLabel.text = String(gamesManager.shared.xGamePts)
        
        showShape()
    }
    

    override func applyGradient() {
        BGGradientView.updateColors()
        playerXNameLabel.textColor = gamesManager.shared.xColor
        playerONameLabel.textColor = gamesManager.shared.oColor
    }

    
    func showShape()
    {
        revealImage.isHidden = true
        let shapePossibilities = ["circle.fill", "triangle.fill", "square.fill"]
        let revealImage = shapePossibilities.randomElement()
        let seconds = Double.random(in: 2...5)
        waitTime(seconds){
            self.revealImage.isHidden = false
        }
    }
    
    func reset()
    {
        for button in oButtonCollection + xButtonCollection
        {
            button.isUserInteractionEnabled = true
        }
        showShape()
    }
    
    func giveMiniPoint(to player: Player)
    {
        switch player
        {
            case .x:
                xMiniPts += 1
            case .o:
                oMiniPts += 1
        }
    }
    
    func didWinMiniGame(for player: Player) -> Bool
    {
        return (player == .x ? xMiniPts : oMiniPts) >= 8
    }
    
    func checkGameEnding()
    {
        if(gamesManager.shared.currentRound>gamesManager.shared.maxRounds)
        {
            let vc = self.storyBoard.instantiateViewController(withIdentifier: "End Game") as! EndGameViewController
            
            self.navigationController?.setViewControllers([vc], animated: false)
        }
        let vc = self.storyBoard.instantiateViewController(withIdentifier: "Tic Tac Toe") as! TicTacToeViewController
        
        self.navigationController?.setViewControllers([vc], animated: false)
    }
}
