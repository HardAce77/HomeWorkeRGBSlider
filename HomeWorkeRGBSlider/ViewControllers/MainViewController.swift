//
//  MainViewController.swift
//  HomeWorkeRGBSlider
//
//  Created by Nikita Neluybin on 12.10.2022.
//

import UIKit

protocol ColorSettingsViewControllerDelegate {
    func setNewColor(from view: UIView)
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorSettingsVC = segue.destination as? ColorSettingsViewController else { return }
        colorSettingsVC.delegate = self
        colorSettingsVC.mainViewColor = self.view.backgroundColor
    }
}

extension MainViewController: ColorSettingsViewControllerDelegate {
    func setNewColor(from view: UIView) {
        self.view.backgroundColor = view.backgroundColor
    }
}
