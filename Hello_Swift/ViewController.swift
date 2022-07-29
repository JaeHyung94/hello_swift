//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    
    let imagePicker = UIImagePickerController()
    var numImage = 0
    var capturedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleCamera(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            if numImage < 3 {
                numImage += 1
            } else {
                numImage = 0
            }
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func handleLibrary(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            if numImage < 3 {
                numImage += 1
            } else {
                numImage = 1
            }
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func handleReset(_ sender: UIButton) {
        imageView1.image = nil
        imageView2.image = nil
        imageView3.image = nil
        numImage = 0
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        numImage -= 1
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        capturedImage = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
        
        if numImage == 1 {
            imageView1.image = capturedImage
        } else if numImage == 2 {
            imageView2.image = capturedImage
        } else if numImage == 3 {
            imageView3.image = capturedImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}
