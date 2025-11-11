//
//  ViewController.swift
//  Homework8.4
//
//  Created by Admin on 03/11/2025.
//

import UIKit

class ViewController: UIViewController {
    
    enum MoveButtons {
        case up, down, left, right
    }
    
    @IBOutlet weak var UPoutlet: UIButton!
    
    @IBAction func UP(_ sender: UIButton) {
        moveBall(to: .up)
    }
   
    
    @IBAction func DOWN(_ sender: UIButton) {
        moveBall(to: .down)
    }
    
    @IBAction func LEFT(_ sender: UIButton) {
        moveBall(to: .left)
    }
    
    @IBAction func RIGHT(_ sender: UIButton) {
        moveBall(to: .right)
    }
    
    let circle = UIView()
    
    var buttonTopY: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circle.frame = CGRect(x: 150, y: 300, width: 50, height: 50)
        circle.backgroundColor = .systemPurple
        circle.layer.cornerRadius = circle.frame.height / 2
        
        view.addSubview(circle)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonTopY = UPoutlet.frame.minY
    }
        
        
    func moveBall(to direction: MoveButtons) {
        let moveDistance: CGFloat = 30.0
        
        var newCenter = circle.center
        
        let radius = circle.frame.height / 2
        
        
        
        switch direction {
        case .up:
        if circle.frame.minY - moveDistance >= 0 {
        newCenter.y -= moveDistance
        }
            
        case .down:
        if circle.frame.maxY + moveDistance <= buttonTopY {
        newCenter.y += moveDistance
        } else {
        newCenter.y = buttonTopY - radius
        }
            
        case .left:
        if circle.frame.minX - moveDistance >= 0 {
        newCenter.x -= moveDistance
        }
            
        case .right:
        if circle.frame.maxX + moveDistance <= view.bounds.width {
        newCenter.x += moveDistance
        }
        }
            
        circle.center = newCenter
        
        }
        
        
    }


