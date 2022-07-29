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
    @IBOutlet var sizeButton: UIButton!
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var deligate: EditDeligate?
    var isOn = false
    var isBig = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelEditType.text = textWayValue
        messageInput.text = textMessage
        onOffSwitch.isOn = isOn
        
        if isBig {
            sizeButton.setTitle("축소", for: UIControl.State())
        } else {
            sizeButton.setTitle("확대", for: UIControl.State())
        }
    }
    
    @IBAction func handleEditFinish(_ sender: UIButton) {
        if deligate != nil {
            deligate?.didMessageEditDone(self, message: messageInput.text!)
            deligate?.didImageOnOffDone(self, isOn: isOn)
            deligate?.didImageSizeChangeDone(self, isBig: isBig)
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

    @IBAction func handleSizeChange(_ sender: UIButton) {
        if isBig {
            isBig = false
            sizeButton.setTitle("축소", for: UIControl.State())
        } else {
            isBig = true
            sizeButton.setTitle("확대", for: UIControl.State())
        }
    }
}
