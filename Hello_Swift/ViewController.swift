//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var arrowUpImage: UIImageView!
    @IBOutlet var arrowLeftImage: UIImageView!
    @IBOutlet var arrowRightImage: UIImageView!
    @IBOutlet var arrowDownImage: UIImageView!
    
    var arrowUp = [UIImage]()
    var arrowLeft = [UIImage]()
    var arrowRight = [UIImage]()
    var arrowDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        arrowUp.append(UIImage(named: "arrow-up-black.png")!)
        arrowUp.append(UIImage(named: "arrow-up-red.png")!)
        arrowUp.append(UIImage(named: "arrow-up-green.png")!)
        
        arrowLeft.append(UIImage(named: "arrow-left-black.png")!)
        arrowLeft.append(UIImage(named: "arrow-left-red.png")!)
        arrowLeft.append(UIImage(named: "arrow-left-green.png")!)
        
        arrowRight.append(UIImage(named: "arrow-right-black.png")!)
        arrowRight.append(UIImage(named: "arrow-right-red.png")!)
        arrowRight.append(UIImage(named: "arrow-right-green.png")!)
        
        arrowDown.append(UIImage(named: "arrow-down-black.png")!)
        arrowDown.append(UIImage(named: "arrow-down-red.png")!)
        arrowDown.append(UIImage(named: "arrow-down-green.png")!)
        
        arrowUpImage.image = arrowUp[0]
        arrowLeftImage.image = arrowLeft[0]
        arrowRightImage.image = arrowRight[0]
        arrowDownImage.image = arrowDown[0]
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            print(swipeGesture)
            arrowUpImage.image = arrowUp[0]
            arrowLeftImage.image = arrowLeft[0]
            arrowRightImage.image = arrowRight[0]
            arrowDownImage.image = arrowDown[0]
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                print(1)
                arrowUpImage.image = arrowUp[1]
            case UISwipeGestureRecognizer.Direction.left:
                print(2)
                arrowLeftImage.image = arrowLeft[1]
            case UISwipeGestureRecognizer.Direction.right:
                print(3)
                arrowRightImage.image = arrowRight[1]
            case UISwipeGestureRecognizer.Direction.down:
                print(4)
                arrowDownImage.image = arrowDown[1]
            default:
                break
            }
        }
    }
}
