//
//  ViewController.swift
//  GunplaHunterV2
//
//  Created by Francis Jemuel Bergonia on 01/11/2017.
//  Copyright © 2017 Francis Jemuel Bergonia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    
    @IBOutlet weak var labelTEXT: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    //MARK: Default Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //The self refers to the ViewController class, because it’s referenced inside the scope of the ViewController class definition.
        textField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: Actions or Methods Implemented
    
    @IBAction func resetButtonWasPressed(_ sender: UIButton) {
    labelTEXT.text = "Default Text"
    textField.text = ""
    print("reset was pressed")
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide Keyboard
        textField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
        print("selectImage was pressed")
    }
    
    
    //MARK: UIImagePickerDelegate Functions
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker controller if cancelled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else { fatalError ("Expected a dictionary containing an image, but was provided the following: \(info)") }
        
        photoImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: UITextFieldDelegate Functions
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
        labelTEXT.text = textField.text
        list.append(textField.text!)
        print("Did End Editing")
    }
    
}

