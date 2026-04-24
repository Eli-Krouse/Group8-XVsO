//
//  BaseViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/22/26.
//

import UIKit

class BaseViewController: UIViewController
{
    //basic definitions for cleaner code
    let center = NotificationCenter.default
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    //created one observer for all viewDidLoads
    override func viewDidLoad(){
        super.viewDidLoad()
        center.addObserver(self, selector: #selector(applyGradient), name: .updatedGradient, object: nil)
        
        applyGradient()
    }
    
    //details in individual ViewControllers
    @objc func applyGradient(){}
    
    func waitTime(_ seconds: Double, code: @escaping () -> Void)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds){code()}
    }
    
    deinit
    {
        center.removeObserver(self)
    }
}

//class definition for singleton
class GamesManager
{
    static let shared = GamesManager()
    
    private init(){} //makes it so you cant make more GamesManager objects
    
    var xColor: UIColor = .red
    var oColor: UIColor = .blue
    
    var xGamePts = 0
    var oGamePts = 0
    
    var maxRounds = 1
    var currentRound = 1
}

// allows for .updatedFradient in NSNotifs
extension NSNotification.Name
{
    static let updatedGradient = NSNotification.Name("updatedGradient")
}

//player enum for cleaner code
enum Player: String
{
    case x = "X"
    case o = "O"
    
    var color: UIColor
    {
        switch(self)
        {
            case .x: return GamesManager.shared.xColor
            case .o: return GamesManager.shared.oColor
        }
    }
}
