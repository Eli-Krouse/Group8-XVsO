//
//  DotsNBoxesViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class DotsNBoxesViewController: BaseViewController {

    @IBOutlet weak var settingsButton: UIButton!
    
    @IBOutlet weak var playerONameLabel: UILabel!
    
    @IBOutlet weak var playerXNameLabel: UILabel!
    
    @IBOutlet var BGGradientView: GradientView!
    
    
    @IBOutlet weak var gamePointOLabel: UILabel!
    
    @IBOutlet weak var gamePointXLabel: UILabel!
    
    @IBOutlet weak var oMinigamePtsLabel: UILabel!
    
    @IBOutlet weak var xMinigamePtsLabel: UILabel!
    
    
    @IBOutlet var boxLabels: [UILabel]!
    
    
    var hLines: [[LineState]] = Array(repeating: Array(repeating: .empty, count: 6), count: 5)
    var vLines: [[LineState]] = Array(repeating: Array(repeating: .empty, count: 5), count: 6)
    var boxes: [[Player?]] = Array(repeating: Array(repeating: nil, count: 5), count: 5)
    var buttontoLineDict: [UIButton: LinePosition] = [:]
    
    var currentPlayer: Player = .x

  
    @IBAction func lineTapped(_ sender: Any)
    {
        guard let button = sender as? UIButton else
        {
            return
        }
        let position = linePosition(of: button)
        drawLine(row: position.row, col: position.col, position.isHorizontal)
        button.backgroundColor = currentPlayer.color
        button.isUserInteractionEnabled = false
    }
    
    func drawLine(row: Int, col: Int, _ isHorizontal: Bool)
    {
        if(isHorizontal)
        {
            hLines[row][col] = (currentPlayer == .x) ? .x : .o
        }else
        {
            vLines[row][col] = (currentPlayer == .x) ? .x : .o
        }
        
        let boxesCreated = didBoxComplete(row: row, col: col, isHorizontal)
        
        if(boxesCreated == 0)
        {
            currentPlayer = (currentPlayer == .x) ? .x : .o
        }
        updateMinigamePoints(boxesCreated)
        updateBoxUI()
    }
    
    func didBoxComplete(row: Int, col: Int, _ isHorizontal: Bool) -> Int
    {
        var created = 0
        if(isHorizontal)
        {
            created += checkBox(top: row-1, left: col)
            created += checkBox(top: row, left: col)
        }else
        {
            created += checkBox(top: row, left: col-1)
            created += checkBox(top: row, left: col)
        }
        return created
    }
    
    func checkBox(top: Int, left: Int) -> Int
    {
        guard top >= 0, top < 5, left >= 0, left < 5, boxes[top][left] == nil, top+1 < vLines.count, left+1 < vLines[0].count else
        {
            return 0
        }
        
        let surroundingLines: [LineState] = [hLines[top+1][left], hLines[top][left], vLines[top][left+1], vLines[top][left]]
        
        if(surroundingLines.allSatisfy { $0 != .empty})
        {
            boxes[top][left] = currentPlayer
            return 1
        }
        return 0
    }
    
    func linePosition(of button: UIButton) -> LinePosition
    {
        var tag = button.tag
        if tag >= 100
        {
            tag = tag - 100
            return LinePosition(row: tag/10, col: tag%10, isHorizontal: false)
        } else
        {
            return LinePosition(row: tag/10, col: tag%10, isHorizontal: true)
        }
    }
    
    func labelAt(row: Int, col: Int) -> UILabel?
    {
        return boxLabels.first{$0.tag == (row * 10) + col}
    }
    
    func updateMinigamePoints(_ total: Int)
    {
        guard let xPoints = Int(xMinigamePtsLabel.text!), let oPoints = Int(oMinigamePtsLabel.text!) else
        {
            return
        }
        switch(currentPlayer)
        {
            case .x:
                xMinigamePtsLabel.text = "\(xPoints)"
            case .o:
                oMinigamePtsLabel.text = "\(oPoints)"
        }
    }
    
    func updateBoxUI()
    {
        for row in 0..<5
        {
            for col in 0..<5
            {
                if let player = boxes[row][col], let label = labelAt(row: row, col: col)
                {
                    label.text = (currentPlayer == .x) ? "X" : "O"
                    label.textColor = (currentPlayer == .x) ? GamesManager.shared.xColor : GamesManager.shared.oColor
                }
            }
        }
    }
    
    func didGameEnd()
    {
        for row in boxes
        {
            for box in row
            {
                if(box == nil)
                {
                    return
                }
            }
        }
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "Speed Test") as! SpeedTestViewController
        
        navigationController?.setViewControllers([vc], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
        settingsButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingsButton.tintColor = .gray
        gamePointOLabel.text = String(GamesManager.shared.oGamePts)
        gamePointXLabel.text = String(GamesManager.shared.xGamePts)
        
        xMinigamePtsLabel.tintColor = GamesManager.shared.xColor
        oMinigamePtsLabel.tintColor = GamesManager.shared.oColor
        xMinigamePtsLabel.text = "0"
        oMinigamePtsLabel.text = "0"
    }
    
    
    override func applyGradient() {
        BGGradientView.updateColors()
        playerXNameLabel.textColor = GamesManager.shared.xColor
        playerONameLabel.textColor = GamesManager.shared.oColor
    }

}

enum LineState
{
    case empty, x, o
}

struct LinePosition
{
    let row: Int
    let col: Int
    let isHorizontal: Bool
}
