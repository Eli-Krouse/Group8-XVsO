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
    
    //option buttons allow for an NSNotif to be posted, which is caught by the observer and updates gradients (via apply gradient)
    @IBAction func opt1Button(_ sender: Any)
    {
        GamesManager.shared.oColor = .red
        GamesManager.shared.xColor = .blue
        center.post(name: .updatedGradient, object: nil)
    }
    
    @IBAction func opt2Button(_ sender: Any)
    {
        GamesManager.shared.oColor = .yellow
        GamesManager.shared.xColor = .green
        center.post(name: .updatedGradient, object: nil)
    }
    
    @IBAction func opt3Button(_ sender: Any)
    {
        GamesManager.shared.oColor = .systemPink
        GamesManager.shared.xColor = .purple
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


