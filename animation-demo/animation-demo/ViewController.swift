//
//  ViewController.swift
//  animation-demo
//
//  Created by Johel Zarco on 02/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let stackView = UIStackView()
    let durationSlider = UISlider()
    let durationLabel = UILabel()
    let angleSlider = UISlider()
    let angleLabel = UILabel()
    let offsetSlider = UISlider()
    let offsetLabel = UILabel()
    
    let margin : CGFloat = 20

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        layout()
    }

}

extension ViewController{
    
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
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(durationSlider)
        stackView.addArrangedSubview(durationLabel)
        stackView.addArrangedSubview(angleSlider)
        stackView.addArrangedSubview(angleLabel)
        stackView.addArrangedSubview(offsetSlider)
        stackView.addArrangedSubview(offsetLabel)
        
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
    }
    
    @objc func angleChanged(_ sender : UISlider!){
        print(sender.value)
    }
    @objc func offsetChanged(_ sender : UISlider!){
        print(sender.value)
    }
}
