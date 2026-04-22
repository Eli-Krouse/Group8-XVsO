//
//  ColorSchemeSettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/22/26.
//

import UIKit

class ColorSchemeSettingsViewController: UIViewController
{
    
    @IBOutlet weak var exampleView: GradientView!
    
    @IBAction func opt1Button(_ sender: Any)
    {
        gamesManager.shared.oColor = .red
        gamesManager.shared.xColor = .blue
    }
    
    @IBAction func opt2Button(_ sender: Any)
    {
        gamesManager.shared.oColor = .yellow
        gamesManager.shared.xColor = .green
    }
    
    @IBAction func opt3Button(_ sender: Any)
    {
        gamesManager.shared.oColor = .systemPink
        gamesManager.shared.xColor = .purple
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(applyGradient), name: .updatedGradient, object: nil)
        applyGradient()
    }
    
    @objc func applyGradient()
    {
        exampleView.updateColors()
    }

}


