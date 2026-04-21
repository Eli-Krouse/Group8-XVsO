//
//  SettingsViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/20/26.
//

import UIKit

class SettingsViewController: UIViewController
{
    
    let generalSettings = ["General", "Color Scheme"]
    let gameplaySettings = ["All Games", "Tic-Tac-Toe", "Dots-N-Boxes", "Speed Test"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
    }
}
