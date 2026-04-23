//
//  BaseViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/22/26.
//

import UIKit

class BaseViewController: UIViewController
{

    let center = NotificationCenter.default
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        center.addObserver(self, selector: #selector(applyGradient), name: .updatedGradient, object: nil)
        
        applyGradient()
    }
    
    @objc func applyGradient(){}
    
    func waitTime(_ seconds: Double)
    {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds){}
    }
    
    deinit
    {
        center.removeObserver(self)
    }
}

class gamesManager
{
    static let shared = gamesManager()
    
    private init() {}
    
    var xColor: UIColor = .red

    var oColor: UIColor = .blue
    
    var xGamePts = 0
    var oGamePts = 0
    
    var maxRounds = 1
    var currentRound = 1
}

extension NSNotification.Name
{
    static let updatedGradient = NSNotification.Name("updatedGradient")
}
