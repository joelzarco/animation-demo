//
//  ViewController.swift
//  animation-demo
//
//  Created by Johel Zarco on 02/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let bellView = NotificationBellView()
    
    let stackView = UIStackView()
    let durationSlider = UISlider()
    let durationLabel = UILabel()
    let angleSlider = UISlider()
    let angleLabel = UILabel()
    let offsetSlider = UISlider()
    let offsetLabel = UILabel()
    let resetButton = UIButton()
    
    
    let margin : CGFloat = 20
    let size : CGFloat = 128

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupBell()
        style()
        layout()
    }

}

extension ViewController{
    
    private func setupBell(){
        
        view.addSubview(bellView)
        bellView.translatesAutoresizingMaskIntoConstraints = false
        bellView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin).isActive = true
        bellView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bellView.heightAnchor.constraint(equalToConstant: size).isActive = true
        bellView.widthAnchor.constraint(equalTo: bellView.widthAnchor).isActive = true
        
    }
    
    private func style(){
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 20
        
        Utilities.styleSlideBar(slider: durationSlider)
        durationSlider.addTarget(self, action: #selector(durationChanged(_:)), for: .valueChanged)
        Utilities.styleLabel(label: durationLabel, with: "Duration")
        
        Utilities.styleSlideBar(slider: angleSlider)
        angleSlider.addTarget(self, action: #selector(angleChanged(_:)), for: .valueChanged)
        Utilities.styleLabel(label: angleLabel, with: "Angle")
        
        Utilities.styleSlideBar(slider: offsetSlider)
        offsetSlider.addTarget(self, action: #selector(offsetChanged(_:)), for: .valueChanged)
        Utilities.styleLabel(label: offsetLabel, with: "Offset")
        
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle("Reset", for: .normal)
        resetButton.tintColor = .white
        resetButton.addTarget(self, action: #selector(resetValues), for: .primaryActionTriggered)
        
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(durationSlider)
        stackView.addArrangedSubview(durationLabel)
        stackView.addArrangedSubview(angleSlider)
        stackView.addArrangedSubview(angleLabel)
        stackView.addArrangedSubview(offsetSlider)
        stackView.addArrangedSubview(offsetLabel)
        stackView.addArrangedSubview(resetButton)
        
    }
    
    private func layout(){
        
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: margin).isActive = true
        view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: margin).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

// MARK: Actions
extension ViewController{
    @objc func durationChanged(_ sender : UISlider!){
        print(sender.value)
        bellView.duration = Double(sender.value) * 2
    }
    
    @objc func angleChanged(_ sender : UISlider!){
        print(sender.value)
        let normalized = CGFloat(sender.value) * (.pi / 2)
        bellView.angle = normalized
    }
    
    @objc func offsetChanged(_ sender : UISlider!){
        print(sender.value)
        bellView.yOffset = CGFloat(sender.value)
    }
    
    @objc func resetValues(sender : UIButton){
        print("reset tapped")
        durationSlider.value = 0.5
        angleSlider.value = 0.5
        offsetSlider.value = 0.5

        bellView.duration = Double(1)
        bellView.angle = .pi/8
        bellView.yOffset = 0.5
    }
}
