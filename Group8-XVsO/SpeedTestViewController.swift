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
    
    

    
    
    @IBAction func oButtonTapped(_ sender: Any)
    {
        guard let button = sender as? UIButton else
        {
            return
        }
        
        var speedColor: UIColor?
        
        if(isCorrect(button))
        {
            speedColor = .green
            oCircleButton.isUserInteractionEnabled = false
            oTriButton.isUserInteractionEnabled = false
            oSqrButton.isUserInteractionEnabled = false
            xCircleButton.isUserInteractionEnabled = false
            xTriButton.isUserInteractionEnabled = false
            xSqrButton.isUserInteractionEnabled = false

        }
        else
        {
            speedColor = .red
        }
        
        switch(button)
        {
            case oCircleButton:
                o1.image = UIImage(systemName: "circle.fill")
                o1.tintColor = speedColor
            
            case oTriButton:
                o1.image = UIImage(systemName: "triangle.fill")
                o1.tintColor = speedColor
        
            case oSqrButton:
                o1.image = UIImage(systemName: "square.fill")
                o1.tintColor = speedColor
        
        default:
            return
        }
        
    }
    
    @IBAction func xButtonTapped(_ sender: Any)
    {
        
    }
    
    func isCorrect(_ button: UIButton) -> Bool
    {
        
        
        return false
    }
    
    func makeUninteractable(_ buttons: [UIButton])
    {
        for button in buttons
        {
            button.isUserInteractionEnabled = false
        }
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
        let shapeRand = Int.random(in: 0...2)
        revealImage.image = UIImage(systemName: "circle.fill")
        let seconds = Double.random(in: 1...3)
        waitTime(seconds){}
        self.revealImage.isHidden = false
    }
    
}
