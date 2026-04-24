//
//  SettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class SettingsViewController: BaseViewController
{
    
    let generalSettings = ["General", "Color Scheme"]
    let gameplaySettings = ["All Games", "Tic-Tac-Toe", "Dots-N-Boxes", "Speed Test"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
        // Do any additional setup after loading the view.
    }
}

//UI Table extension. classic style. (chevron/arrow changed in detail page)
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch(section)
        {
        case 0:
            return generalSettings.count
        case 1:
            return gameplaySettings.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch(indexPath.section)
        {
        case 0:
            cell.textLabel?.text = generalSettings[indexPath.row]
        case 1:
            cell.textLabel?.text = gameplaySettings[indexPath.row]
        default:
            break
        }
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    //no data is passed, so no forces casting (as!)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        var vc: UIViewController?
        switch(indexPath.section)
        {
        case 0:
             vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: generalSettings[indexPath.row] + " Settings")
        case 1:
            vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: gameplaySettings[indexPath.row] + " Settings")
        default:
            break
        }
        
        if let vc = vc
        {
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
}

