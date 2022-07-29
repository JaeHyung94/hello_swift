//
//  EditViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var labelEditType: UILabel!
    @IBOutlet var messageInput: UITextField!
    @IBOutlet var labelSwitch: UILabel!
    @IBOutlet var onOffSwitch: UISwitch!
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var deligate: EditDeligate?
    var isOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelEditType.text = textWayValue
        messageInput.text = textMessage
        onOffSwitch.isOn = isOn
    }
    
    @IBAction func handleEditFinish(_ sender: UIButton) {
        if deligate != nil {
            deligate?.didMessageEditDone(self, message: messageInput.text!)
            deligate?.didImageOnOffDone(self, isOn: isOn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func handleOnOfSwitch(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }

}
