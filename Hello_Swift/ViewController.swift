//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

protocol EditDeligate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool)
    func didImageSizeChangeDone(_ controller: EditViewController, isBig: Bool)
}

class ViewController: UIViewController, EditDeligate{
    @IBOutlet var messageInput: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    let imageOn = UIImage(named: "lamp_on.png")
    let imageOff = UIImage(named: "lamp_off.png")
    var isOn = true
    var isBig = false
    var orgBig = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imageOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue: use Bar Button"
        }
        
        editViewController.textMessage = messageInput.text!
        editViewController.isOn = isOn
        editViewController.isBig = orgBig
        editViewController.deligate = self
        
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        messageInput.text = message
    }
    
    func didImageOnOffDone(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imageView.image = imageOn
            self.isOn = true
        } else {
            imageView.image = imageOff
            self.isOn = false
        }
    }
    
    func didImageSizeChangeDone(_ controller: EditViewController, isBig: Bool) {
        let scale = 2.0
        var afterWidth: CGFloat
        var afterHeight: CGFloat
        
        if isBig {
            if orgBig {
                
            } else {
                self.isBig = false
                self.orgBig = true
                
                afterWidth = imageView.frame.width * scale
                afterHeight = imageView.frame.height * scale
                
                imageView.frame.size = CGSize(width: afterWidth, height: afterHeight)
            }
        } else {
            if orgBig {
                self.isBig = true
                self.orgBig = false
                
                afterWidth = imageView.frame.width / scale
                afterHeight = imageView.frame.height / scale
                
                imageView.frame.size = CGSize(width: afterWidth, height: afterHeight)
            } else {
                
            }
        }
    }
}
