//
//  Extension + UIButton.swift
//  AnimatorAplication
//
//  Created by Максим Зыкин on 14.01.2023.
//

import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        // уменьшение кнопки
        pulse.fromValue = 0.95
        // увеличиваем кнопку до исходной
        pulse.toValue = 1
        // длительность анимации
        pulse.duration = 0.6
        //
        pulse.autoreverses = true
        // кол повторений
        pulse.repeatCount = 2
        // насколько увеличивается скорость изначально
        pulse.initialVelocity = 0.5
        pulse.damping = 1

        // добавление анимации
        layer.add(pulse, forKey: nil)
    }
}
