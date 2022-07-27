//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/26.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    let NUM_COLUMN = 2
    var imageNameArray = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg"]
    
    @IBOutlet var imagePicker: UIPickerView!
    @IBOutlet var labelSelectedItem: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imagePicker.delegate = self
        self.imagePicker.dataSource = self
        
        
        labelSelectedItem.text = imageNameArray[0]
        imageView.image = UIImage(named: imageNameArray[0])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageNameArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return NUM_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return imageNameArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let target = imageNameArray[row]
        //몇 번째 column에서 온 건지는 component로 구분
        if(component == 0) {
            labelSelectedItem.text = target
        } else {
            imageView.image = UIImage(named: target)
        }
    }
}
