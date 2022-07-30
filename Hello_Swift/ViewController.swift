//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var widthInput: UITextField!
    
    var lineColor: CGColor!
    var lineWidth: CGFloat! = 2.0
    var lastPoint: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lineColor = UIColor.black.cgColor
        widthInput.text = String(Int(lineWidth))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imageView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(lineWidth)
        context.setLineCap(.round)
        context.setStrokeColor(lineColor)
        
        let touch = touches.first! as UITouch
        let currentPoint = touch.location(in: imageView)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height))
        
        context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imageView.frame.size)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(lineWidth)
        context.setLineCap(.round)
        context.setStrokeColor(lineColor)
        
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.frame.width, height: imageView.frame.height))
        
        context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imageView.image = nil
        }
    }
    
    
    @IBAction func txtEditChange(_ sender: UITextField) {
        if widthInput.text != "" {
            lineWidth =    CGFloat(Int(widthInput.text!)!)
        }
    }
    
    @IBAction func txtDidEndOnExit(_ sender: UITextField) {
        lineWidth =    CGFloat(Int(widthInput.text!)!)
    }
    
    @IBAction func txtTouchDown(_ sender: UITextField) {
        widthInput.selectAll(UITextField.self)
    }
    
    @IBAction func handleColorChange(_ sender: UIButton) {
        if sender.currentTitle == "검정색" {
            lineColor = UIColor.black.cgColor
        } else if sender.currentTitle == "빨간색" {
            lineColor = UIColor.red.cgColor
        } else if sender.currentTitle == "녹색" {
            lineColor = UIColor.green.cgColor
        } else if sender.currentTitle == "파란색" {
            lineColor = UIColor.blue.cgColor
        }
    }
    
    @IBAction func handleWidthChange(_ sender: UITextField) {
        lineWidth = CGFloat((sender.text! as NSString).floatValue)
    }
    
    @IBAction func handleClear(_ sender: UIButton) {
        imageView.image = nil
    }
}
