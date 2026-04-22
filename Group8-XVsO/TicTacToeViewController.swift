//
//  TicTacToeViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class TicTacToeViewController: UIViewController {

    
    @IBOutlet weak var sqr00Button: UIButton!
    
    @IBOutlet weak var sqr01Button: UIButton!
    
    @IBOutlet weak var sqr02Button: UIButton!
    
    @IBOutlet weak var sqr10Button: UIButton!
    
    @IBOutlet weak var sqr11Button: UIButton!
    
    @IBOutlet weak var sqr12Button: UIButton!
    
    @IBOutlet weak var sqr20Button: UIButton!
    
    @IBOutlet weak var sqr21Button: UIButton!
    
    @IBOutlet weak var sqr22Button: UIButton!
    
    
    
    @IBOutlet weak var ptX1: UILabel!
    
    @IBOutlet weak var ptX2: UILabel!
    
    @IBOutlet weak var ptX3: UILabel!
    
    @IBOutlet weak var ptO1: UILabel!
    
    @IBOutlet weak var ptO2: UILabel!
    
    @IBOutlet weak var ptO3: UILabel!
    
    
    @IBOutlet weak var gamePointOLabel: UILabel!
    
    @IBOutlet weak var gamePointXLabel: UILabel!
    
    
    var xColor: UIColor? // nill coalece to red
    var oColor: UIColor? // nil coalece to blue
    
    @IBOutlet weak var settingsButton: UIButton!
    
    
    @IBAction func TTTBoardTapped(_ sender: Any)
    {
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
        settingsButton.setImage(UIImage(systemName: "gearshape.fill")?.withTintColor(.gray), for: .normal)
    }
    


    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
