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
}

class ViewController: UIViewController, EditDeligate{
    @IBOutlet var messageInput: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    let imageOn = UIImage(named: "lamp_on.png")
    let imageOff = UIImage(named: "lamp_off.png")
    var isOn = true
    
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
}
