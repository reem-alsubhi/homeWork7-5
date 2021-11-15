//
//  ViewController.swift
//  homeWork7-5
//
//  Created by MAC on 8/04/1443 AH.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate , UICollectionViewDelegate , UICollectionViewDataSource {
    var images : [UIImage] = []
    
    @IBOutlet weak var myPictures: UICollectionView!
    
    @IBAction func takePhoto(_ sender: Any) {
        let alert = UIAlertController(title: "Take photo", message: nil, preferredStyle: .actionSheet )
        
        alert.addAction(UIAlertAction(title: "camera", style: .default, handler: {action in
            self.Addpic(type:.camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Libarary", style: .default, handler: {action in
            self.Addpic(type: .photoLibrary)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler:nil))
        
        present(alert, animated: true , completion: nil)
    }
    
    @IBAction func delet(_ sender: Any) {
        let delete = UIAlertController(title: "Are you sure to Delete", message: nil, preferredStyle: .alert)
        delete.addAction(UIAlertAction(title: "Yes", style: .default, handler: {action in
            self.images.removeAll()
            self.myPictures.reloadData()
        }))
        delete.addAction(UIAlertAction(title: "NO", style: .default, handler: {action in
        }))
        present(delete, animated: true, completion: nil)
    }
    
    //
    
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! myUICllectionViewCell
        cell.image.image = images[indexPath.row]
        return cell
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        let imageSource = info[.originalImage] as! UIImage
        self.images.append(imageSource)
        self.myPictures.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func takeAdd () {
        
        
    }
    
    // func when user choose camera
    func takePhoto(type : UIImagePickerController.SourceType){
        let picker = UIImagePickerController()
        picker.sourceType = type
        //    when edit size photo
        picker.allowsEditing = false
        picker.delegate = self
        present(picker , animated: true , completion: nil)
        
        
    }
    
    func Addpic (type: UIImagePickerController.SourceType){
        let photo = UIImagePickerController()
        photo .sourceType = type
        photo .allowsEditing = true
        photo .delegate = self
        present(photo, animated: true, completion: nil)}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPictures.delegate = self
        myPictures.dataSource = self
    }
    
    //        // Do any additional setup after loading the view.
    //    }
}

