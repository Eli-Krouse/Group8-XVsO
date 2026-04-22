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
    private var colors: [UIColor] = [.red, .blue]
    {
        didSet
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

    private func setup()
    {
        gradientLayer.colors = colors.map { $0.cgColor }
        
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)

        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func updateColors()
    {
        gradientLayer.colors = colors.map { $0.cgColor }
    }

    override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = bounds
    }

}
