//
//  ViewController.swift
//  AnimatorAplication
//
//  Created by Максим Зыкин on 14.01.2023.
//

import Spring

class ViewController: UIViewController {
    
    private var origeCordinate: CGFloat?
    
    @IBOutlet weak var coreAnimatedView: UIView!
    @IBOutlet weak var springAnimationView: SpringButton!
    
    @IBOutlet weak var randomAnimationView: SpringView!
    @IBOutlet weak var randomAnimationLabel: UILabel!
    
    private var animation = Animation.getRandomAnimation()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        origeCordinate = coreAnimatedView.frame.origin.x
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func actionAnimatedButtonPressed(_ sender: UIButton) {
        sender.pulsate()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat]) { [weak self] in
            guard let self = self else { return }
            if self.coreAnimatedView.frame.origin.x == self.origeCordinate {
                self.coreAnimatedView.frame.origin.x -= 40
            }
        }
    }
    
    @IBAction func springAnimationButtonPressed(_ sender: SpringButton) {
        springAnimationView.animation = Spring.AnimationPreset.fall.rawValue
        springAnimationView.curve = Spring.AnimationCurve.easeIn.rawValue
        springAnimationView.duration = 1
        springAnimationView.animate()
        
        sender.animation = "shake"
        sender.animate()
    }
    
    
    @IBAction func randomAnimarionButton(_ sender: UIButton) {
        randomAnimationLabel.text = animation.description
        
        randomAnimationView.animation = animation.name
        randomAnimationView.force = CGFloat(animation.force)
        randomAnimationView.duration = CGFloat(animation.duration)
        randomAnimationView.delay = CGFloat(animation.delay)
        randomAnimationView.curve = animation.curve
        randomAnimationView.animate()
        
        animation = Animation.getRandomAnimation()
        sender.setTitle("Run \(animation.name)", for: .normal)
    }
    
}

