//
//  ViewController.swift
//  CoreDataSaveAndRetrieveImage
//
//  Created by Sainath Bamen on 16/07/23.
//

import UIKit

class ViewController: UIViewController {
    var photos = [PhotoGallery]()
    @IBOutlet weak var chooseBTn: UIButton!
    @IBOutlet weak var retrieveBtn: UIButton!
    @IBOutlet weak var myStatus: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseBTn.layer.cornerRadius = 30
        retrieveBtn.layer.cornerRadius = 30
    }

    @IBAction func chooseImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
        
    }
    
    @IBAction func retrieveImage(_ sender: Any) {
        let dh = DatabaseHandler()
        photos = dh.retrieveData()
        myImage.image = UIImage(data: photos[photos.count - 1].savedImage! as Data)
        myStatus.text = "Image Retrieved From  CoreData Successfully"
        print("Image has been retrived from Coredata")
    }
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickeImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            myImage.image = pickeImage
            let dh = DatabaseHandler()
            dh.image = myImage.image
            dh.saveImage()
            myStatus.text = "Image Saved in Coredata Successfully."
        }
        dismiss(animated: true, completion: nil)
    }
}
