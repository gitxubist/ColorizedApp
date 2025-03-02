//
//  StartViewController.swift
//  HW 2
//
//  Created by Evgeniy Morozov on 02.03.2025.
//  Copyright © 2025 Alexey Efimov. All rights reserved.
//
import UIKit


final class StartViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CollorTransfer" {
            if let colorCreateVC = segue.destination as? ViewController {
                colorCreateVC.colorView = view
                colorCreateVC.delegate = self
            }
        }
    }
}

// MARK: - StartViewControllerDelegate
extension StartViewController: StartViewControllerDelegate {
    // Обновляем цвет view
    func updateColor(red: CGFloat, green: CGFloat, blue: CGFloat) {
        print(red, green, blue)
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1
        )
    }
}
