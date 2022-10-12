//
//  ViewController.swift
//  HomeWorkeRGBSlider
//
//  Created by Nikita Neluybin on 25.09.2022.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var rgbView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        rgbView.layer.cornerRadius = 30
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        setColor()
    }
    
    private func setColor() {
        rgbView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                          green: CGFloat(greenSlider.value),
                                          blue: CGFloat(blueSlider.value),
                                          alpha: 1)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = String(format: "%.2f", sender.value)
        case 1:
            greenLabel.text = String(format: "%.2f", sender.value)
        default:
            blueLabel.text = String(format: "%.2f", sender.value)
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
    }

}

