//
//  ViewController.swift
//  HomeWorkeRGBSlider
//
//  Created by Nikita Neluybin on 25.09.2022.
//

import UIKit

class ColorSettingsViewController: UIViewController {
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var textFields: [UITextField]!
    
    var delegate: ColorSettingsViewControllerDelegate!
    var mainViewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbView.layer.cornerRadius = 30
        getColorComponent()
        setValue()
        setColor()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func setColor() {
        rgbView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        for (textField, slider) in zip(textFields, [redSlider, greenSlider, blueSlider]) {
            guard let rgbSlider = slider else { return }
            textField.text = string(from: rgbSlider)
        }
    }
    
    private func getColorComponent() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        mainViewColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            redLabel.text = string(from: sender)
            textFields[sender.tag].text = string(from: sender)
        case 1:
            greenLabel.text = string(from: sender)
            textFields[sender.tag].text = string(from: sender)
        default:
            blueLabel.text = string(from: sender)
            textFields[2].text = string(from: sender)
        }
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(from: rgbView)
        dismiss(animated: true)
    }
}

extension ColorSettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textFromTF = textField.text else { return }
        guard let text = Float(textFromTF) else { return }
        switch textField.tag {
        case 0:
            redSlider.value = text
        case 1:
            greenSlider.value = text
        default:
            blueSlider.value = text
        }
        setValue()
        setColor()
    }
}

