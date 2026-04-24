//
//  SetupNavViewController.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/21/26.
//

import UIKit

class SetupNavViewController: UINavigationController
{
    //gets rid of time, battery, wifi, etc
    override var prefersStatusBarHidden: Bool
    {
        return true
    }
}
