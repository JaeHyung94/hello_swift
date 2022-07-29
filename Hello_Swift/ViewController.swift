//
//  ViewController.swift
//  Hello_Swift
//
//  Created by 박재형 on 2022/07/29.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var imageView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var videoURL: URL!
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleTakePhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            customAlert(title: "카메라에 접근할 수 없습니다.", message: "앱이 카메라에 접근할 수 없습니다.")
        }
    }
    
    @IBAction func handleTakeVideo(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            flagImageSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            customAlert(title: "카메라에 접근할 수 없습니다.", message: "카메라에 접근할 수 없습니다.")
        }
    }
    
    @IBAction func handleOpenPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.image"]
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            customAlert(title: "앨범을 열 수 없습니다.", message: "앨범에 접근할 수 없습니다.")
        }
    }
    
    @IBAction func handleOpenVideo(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            flagImageSave = false
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = ["public.movie"]
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            customAlert(title: "앨범을 열 수 없습니다.", message: "앨범에 접근할 수 없습니다.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: "public.image" as String) {
            captureImage = (info[UIImagePickerController.InfoKey.originalImage] as! UIImage)
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imageView.image = captureImage
        } else if mediaType.isEqual(to: "public.movie" as String) {
            if flagImageSave {
                videoURL = (info[UIImagePickerController.InfoKey.mediaURL] as! URL)
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)
            }
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func customAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "넹", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}
