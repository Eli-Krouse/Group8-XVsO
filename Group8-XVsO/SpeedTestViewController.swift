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
    
    //set up Lazy variable Dictionaries for UI handling
    lazy var xDict: [UIButton: UIImageView] = [xCircleButton: x1, xTriButton: x2, xSqrButton: x3]
    lazy var oDict: [UIButton: UIImageView] = [oCircleButton: o1, oTriButton: o2, oSqrButton: o3]
    //lazy var dict for better looking code when resetting guessed picture buttons
    lazy var defaultButtonImages: [UIImageView: UIImage] = [x1: UIImage(systemName: "circlebadge")!, x2: UIImage(systemName: "triangle")!, x3: UIImage(systemName: "square")!, o1: UIImage(systemName: "circlebadge")!, o2: UIImage(systemName: "triangle")!, o3: UIImage(systemName: "square")!]
    
    //oButton tappped function. seperated to identify x or o easier
    @IBAction func oButtonTapped(_ sender: Any)
    {
        guard let button = sender as? UIButton else
        {
            return
        }
        buttonHandler(button, for: .o)
    }
    
    //xButton function
    @IBAction func xButtonTapped(_ sender: Any)
    {
        guard let button = sender as? UIButton else
        {
            return
        }
        
        buttonHandler(button, for: .x)
    }
    
    //button handler. checks if your guess was correct, then awards points or just updates UI and lets the other player get a chance by deactivating just your buttons
    func buttonHandler(_ button: UIButton, for player: Player)
    {
        // checks your guess
        let isCorrectGuess = isCorrect(button, for: player)
        
        //if it is correct, all buttons deactivated and UI with .green etc
        if(isCorrectGuess)
        {
            makeUninteractable(for: .x)
            makeUninteractable(for: .o)
            
            giveMiniPoint(to: player)
            updateMinigamePointUI(for: player)
            updateButtonUI(button, for: player, with: .green)
            waitTime(0.5){
                self.reset()
            }
            //if they guessed correct, we also check if the game ended
            if(didWinMiniGame(for: player))
            {
                switch(player)
                {
                    case .x:
                        GamesManager.shared.xGamePts += 1
                    case .o:
                        GamesManager.shared.oGamePts += 1
                }
                GamesManager.shared.currentRound += 1
                //checks if the round ended
                checkRoundEnding()
            }
            
        }else
        {
            //if their guess was wrong, updae their UI and deactivate their buttons
            makeUninteractable(for: player)
            updateButtonUI(button, for: player, with: .red)
        }
        
        //if both failed, reset and award no points
        var bothFailed = true
        for button in oButtonCollection + xButtonCollection
        {
            if(button.isUserInteractionEnabled == true)
            {
                bothFailed = false
                break;
            }
        }
        if(bothFailed)
        {
            waitTime(0.5) {
                self.reset()
            }
        }
    }
    
    //checks if a player made the corredt choice using dicts
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
    
    //makes the buttons uninteractable
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
    
    //UIupdater for mingame point visualizer
    func updateMinigamePointUI(for player: Player)
    {
        switch(player)
        {
        case .x:
            xMinigamePoints[self.xMiniPts-1].image = UIImage(systemName: "circlebadge.fill")
            xMinigamePoints[self.xMiniPts-1].tintColor = GamesManager.shared.xColor
        
        case .o:
            oMinigamePoints[self.oMiniPts-1].image = UIImage(systemName: "circlebadge.fill")
            oMinigamePoints[self.oMiniPts-1].tintColor = GamesManager.shared.oColor
        }
    }
    
    //updates guess button UI using dicts
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
        
        gamePointOLabel.text = String(GamesManager.shared.oGamePts)
        gamePointXLabel.text = String(GamesManager.shared.xGamePts)
        
        showShape()
    }
    

    override func applyGradient() {
        BGGradientView.updateColors()
        playerXNameLabel.textColor = GamesManager.shared.xColor
        playerONameLabel.textColor = GamesManager.shared.oColor
    }

    //repeated function that gets a random picture and shows it at a random time between 1.5 and 4 secods to simulate a "reaction time guessing game"
    func showShape()
    {
        revealImage.isHidden = true
        let shapePossibilities = ["circle.fill", "triangle.fill", "square.fill"]
        revealImage.image = UIImage(systemName: shapePossibilities.randomElement()!)
        let seconds = Double.random(in: 1.5...4)
        waitTime(seconds){
            self.revealImage.isHidden = false
        }
    }
    
    //makes all buttons interactable again and set's the guess button images back to their defaullt state
    func reset()
    {
        for button in oButtonCollection + xButtonCollection
        {
            button.isUserInteractionEnabled = true
        }
        for(imageView, image) in defaultButtonImages
        {
            imageView.image = image
            imageView.tintColor = .black
        }
        showShape()
    }
    
    //awards minipoints
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
    
    //returns a boolean based on if they won the game
    func didWinMiniGame(for player: Player) -> Bool
    {
        return (player == .x ? xMiniPts : oMiniPts) >= 8
    }
    
    //if the round ends, send you to EndGameViewController, else, go back to TicTacToe
    func checkRoundEnding()
    {
        var vc: UIViewController
        if(GamesManager.shared.currentRound>GamesManager.shared.maxRounds)
        {
             vc = self.storyBoard.instantiateViewController(withIdentifier: "End Game") as! EndGameViewController
        } else
        {
            vc = self.storyBoard.instantiateViewController(withIdentifier: "Tic Tac Toe") as! TicTacToeViewController
        }
        
        navigationController?.setViewControllers([vc], animated: true)
    }
}
