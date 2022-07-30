//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var labelMessage: UILabel!
    @IBOutlet var labelTapCount: UILabel!
    @IBOutlet var labelTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        labelMessage.text = "Touch Started"
        labelTapCount.text = String(touch.tapCount)
        labelTouchCount.text = String(touches.count)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        labelMessage.text = "Touch Moved"
        labelTapCount.text = String(touch.tapCount)
        labelTouchCount.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        labelMessage.text = "Touch Finished"
        labelTapCount.text = String(touch.tapCount)
        labelTouchCount.text = String(touches.count)
    }
}
