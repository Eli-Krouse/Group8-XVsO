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
    
    //Horizontal and vertical line arrays for game logic, array of boxes for when a box is claimed, and label grid to make it easier to set the correct UI label ot the correct player
    var hLines: [[LineState]] = Array(repeating: Array(repeating: .empty, count: 5), count: 6)
    var vLines: [[LineState]] = Array(repeating: Array(repeating: .empty, count: 6), count: 5)
    var boxes: [[Player?]] = Array(repeating: Array(repeating: nil, count: 5), count: 5)
    var labelGrid: [[UILabel]] = Array(repeating: Array(repeating: UILabel(), count: 5), count: 5)
    
    //initial player
    var currentPlayer: Player = .x

    //button tap function
    @IBAction func lineTapped(_ sender: Any)
    {
        //give us a more relevant label for sender, instead of setting sender to UIButton
        guard let button = sender as? UIButton else
        {
            return
        }
        //get the line's pos button tag sys
        let position = linePosition(of: button)
        //sets out button to the correct color, nil is used here because of a bug not allowing color to change on the correct layer
        button.configuration = nil
        button.backgroundColor = currentPlayer.color
        //line cannot be tapped again
        button.isUserInteractionEnabled = false
        //puts the line in hLines or vLines
        drawLine(row: position.row, col: position.col, position.isHorizontal)
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
        
        //checks if any boxes are created, if so, points are allocated and checks for --
        let boxesCreated = didBoxComplete(row: row, col: col, isHorizontal)
        
        updateMinigamePoints(boxesCreated)
        // -- game competion
        didGameEnd()
        
        //if not boxes created, switch players
        if(boxesCreated == 0)
        {
            currentPlayer = (currentPlayer == .x) ? .o : .x
        }
    }
    
    //return the amount of boxes are created
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
    
    //helper function for didBoxCompete. checks the boxes around the line and returns a 1 if a box did complete
    func checkBox(top: Int, left: Int) -> Int
    {
        //return's 0 if out of bounds (double checked)
        guard top >= 0, top < 5, left >= 0, left < 5, boxes[top][left] == nil, top+1 < hLines.count, left+1 < vLines[0].count else
        {
            return 0
        }
        
        //sends array of lines around this particular box
        let surroundingLines: [LineState] = [hLines[top+1][left], hLines[top][left], vLines[top][left+1], vLines[top][left]]
        
        //if theyre all not empty, a new box was created, thus we updated boxes and labelGrid, as well as return an int
        if(surroundingLines.allSatisfy { $0 != .empty})
        {
            boxes[top][left] = currentPlayer
            
            labelGrid[top][left].text = (currentPlayer == .x) ? "X" : "O"
            labelGrid[top][left].textColor = currentPlayer.color
            
            return 1
        }
        return 0
    }
    
    //Uses button tags to find where this button is X1 = Horz or Ver X2 = row X3 = col
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
    
    //updates miniGamePoints
    func updateMinigamePoints(_ total: Int)
    {
        //exits of no points are allocated
        guard total > 0 else
        {
            return
        }
        //updates points for current player w/ nil coalecence incase of error
        switch(currentPlayer)
        {
            case .x:
                let points = (Int(xMinigamePtsLabel.text!) ?? 0) + total
                xMinigamePtsLabel.text = "\(points)"
            case .o:
            let points = (Int(oMinigamePtsLabel.text!) ?? 0) + total
                oMinigamePtsLabel.text = "\(points)"
        }
    }
    
    //checks boxes: if any box is nil, exit the function, else, transition to SpeedTest
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
        
        waitTime(0.5) {
            let vc = self.storyBoard.instantiateViewController(withIdentifier: "Speed Test") as! SpeedTestViewController
            
            self.navigationController?.setViewControllers([vc], animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
        settingsButton.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingsButton.tintColor = .gray
        
        for label in boxLabels
        {
            let row = label.tag / 10
            let col = label.tag % 10
            labelGrid[row][col] = label
        }
        
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

//enum and struct for game logic
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
