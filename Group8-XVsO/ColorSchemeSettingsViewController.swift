//
//  ColorSchemeSettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/22/26.
//

import UIKit

class ColorSchemeSettingsViewController: BaseViewController
{
    
    @IBOutlet weak var exampleView: GradientView!
    
    @IBAction func opt1Button(_ sender: Any)
    {
        gamesManager.shared.oColor = .red
        gamesManager.shared.xColor = .blue
        center.post(name: .updatedGradient, object: nil)
    }
    
    @IBAction func opt2Button(_ sender: Any)
    {
        gamesManager.shared.oColor = .yellow
        gamesManager.shared.xColor = .green
        center.post(name: .updatedGradient, object: nil)
    }
    
    @IBAction func opt3Button(_ sender: Any)
    {
        gamesManager.shared.oColor = .systemPink
        gamesManager.shared.xColor = .purple
        center.post(name: .updatedGradient, object: nil)
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()

    }

    override func applyGradient()
    {
        exampleView.updateColors()
    }
}


