//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController {
    let imageOn = UIImage(named: "lamp-on.png")
    let imageOff = UIImage(named: "lamp-off.png")
    let imageRemove = UIImage(named: "lamp-remove.png")
    
    var isOn = true
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imageOn
    }

    @IBAction func handleOn (_ sender: UIButton) {
        if(isOn) {
            let lampOnAlert = UIAlertController(title: "전구를 켤 수 없습니다.", message: "이미 켜진 전구입니다.", preferredStyle: UIAlertController.Style.alert)
            
            let onAction = UIAlertAction(title: "넹", style: UIAlertAction.Style.default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            imageView.image = imageOn
            isOn = true
        }
    }
    
    @IBAction func handleOff (_ sender: UIButton) {
        if(isOn) {
            let lampOffAlert = UIAlertController(title: "전구 끄기", message: "전구를 끄시겠어요?", preferredStyle: UIAlertController.Style.alert)
            
            let onAction = UIAlertAction(title: "꺼 죠", style: UIAlertAction.Style.default, handler: {
                ACTION in self.imageView.image = self.imageOff
                self.isOn = false
            })
            
            let cancelAction = UIAlertAction(title: "아니용", style: UIAlertAction.Style.destructive, handler: nil)
            
            lampOffAlert.addAction(cancelAction)
            lampOffAlert.addAction(onAction)
            
            present(lampOffAlert, animated: true, completion: nil)
        } else {
            let lampOffAlert = UIAlertController(title: "전구를 끌 수 없습니다.", message: "이미 꺼진 전구입니다.", preferredStyle: UIAlertController.Style.alert)
            
            let onAction = UIAlertAction(title: "넹!", style: UIAlertAction.Style.destructive, handler: nil)
            
            lampOffAlert.addAction(onAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func handleRemove (_ sender: UIButton) {
        let lampRemoveAlert = UIAlertController(title: "전구 제거", message: "전구를 제거하시겠어요?", preferredStyle: UIAlertController.Style.alert)
        
        let lampOnAction = UIAlertAction(title: "전구 켜기", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.imageOn
            self.isOn = true
        })
        
        let lampOffAction = UIAlertAction(title: "전구 끄기", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.imageOff
            self.isOn = false
        })
        
        let lampRemoveAction = UIAlertAction(title: "전구 제거", style: UIAlertAction.Style.default, handler: {
            ACTION in self.imageView.image = self.imageRemove
            self.isOn = false
        })
        
        lampRemoveAlert.addAction(lampOnAction)
        lampRemoveAlert.addAction(lampOffAction)
        lampRemoveAlert.addAction(lampRemoveAction)
        
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}
