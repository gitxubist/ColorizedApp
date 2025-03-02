//
//  ViewController.swift
//  HW 2
//
//  Created by Alexey Efimov on 12.06.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var colorView: UIView!
    
    @IBOutlet private var redLabel: UILabel!
    @IBOutlet private var greenLabel: UILabel!
    @IBOutlet private var blueLabel: UILabel!

    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispersion()
        
//        self.navigationItem.hidesBackButton = true
        
        colorView.layer.cornerRadius = 15
//        setColor()
        
//        redLabel.text = string(from: redSlider)
//        greenLabel.text = string(from: greenSlider)
//        blueLabel.text = string(from: blueSlider)
        dispersion()
    }
    
    @IBAction private func sliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
        }
        
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func dispersion() {
        if let color = colorView.backgroundColor {
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            color.getRed(&red,
                         green: &green,
                         blue: &blue,
                         alpha: &alpha)
            
            redSlider.value = Float(red)
            greenSlider.value = Float(green)
            blueSlider.value = Float(blue)
            
            redLabel.text = "\(red)"
            greenLabel.text = "\(green)"
            blueLabel.text = "\(blue)"
        }
    }
}

extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
