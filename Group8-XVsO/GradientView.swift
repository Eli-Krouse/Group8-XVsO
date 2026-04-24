//
//  GradientView.swift
//  Group8-XVsO
//
//  Created by Krouse, William E. on 4/21/26.
//

import UIKit

class GradientView: UIView
{
    private let gradientLayer = CAGradientLayer()
    private var colors: [UIColor] = [GamesManager.shared.oColor, GamesManager.shared.xColor]
    {
        didSet //when colors are updated, colors are updated
        {
            updateColors()
        }
    }

    override init(frame: CGRect)
    {
    super.init(frame: frame)
    setup()
    }

    required init?(coder: NSCoder)
    {
    super.init(coder: coder)
    setup()
    }

    private func setup() //creates the gradient
    {
        gradientLayer.colors = colors.map { $0.cgColor } // converts UIColors to cgColors
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    //what gets called in gradientApply, updates the colors when changed
    func updateColors()
    {
        let newColors = [GamesManager.shared.oColor, GamesManager.shared.xColor]
        gradientLayer.colors = newColors.map { $0.cgColor }
    }

    //makes the gradient a subview to prevent clipping and to force to bounds
    override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = bounds
    }

}
