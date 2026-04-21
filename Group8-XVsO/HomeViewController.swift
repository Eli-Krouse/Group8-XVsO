//
//  ViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class HomeViewController: UIViewController
{
    
    @IBOutlet weak var playButton: UIButton!
    
    var xColor: UIColor? //nil coalece to Red
    var oColor: UIColor? //nil coalece to Blue
    
    
    @IBAction func playButtonTapped(_ sender: Any)
    {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "Tic Tac Toe") as! TicTacToeViewController
        
        vc.xColor = self.xColor ?? .red
        vc.xColor = self.xColor ?? .blue
        
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

