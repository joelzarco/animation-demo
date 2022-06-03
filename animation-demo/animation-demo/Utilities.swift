//
//  Utilities.swift
//  animation-demo
//
//  Created by Johel Zarco on 03/06/22.
//

import Foundation
import UIKit

class Utilities{
    
    static func styleSlideBar(slider : UISlider){
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0.0
        slider.maximumValue = 1.0
        slider.value = 0.5
        slider.isContinuous = false
        slider.tintColor = .white
    }
    
    static func styleLabel(label : UILabel, with text : String){
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = text
    }
}
