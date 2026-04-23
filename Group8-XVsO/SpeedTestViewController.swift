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
    
    @IBOutlet weak var oTriangleButton: UIButton!
    
    @IBOutlet weak var oSquareButton: UIButton!
    
    @IBOutlet weak var xCircleButton: UIButton!
    
    @IBOutlet weak var xTriangleButton: UIButton!
    
    @IBOutlet weak var xSquareButton: UIButton!
    
    
    
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
        waitTime(seconds)
        self.revealImage.isHidden = false
    }
    
}
