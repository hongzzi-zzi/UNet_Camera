//
//  isPhotobooth.swift
//  UNet_camera
//
//  Created by 안홍은 on 2022/07/12.
//

import UIKit
import SwiftUI

struct isPhotobooth{
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode
    
    weak var displayView: UIImageView!
    
    var sourceImg: UIImage! {
        didSet {
            displayView.image = sourceImg
        }
    }
    
    func getImage(){
        ImagePicker(sourceType: .camera, selectedImage: self.$selectedImage)
    }
    
    mutating func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {    // 수정된 이미지가 있을 경우
            sourceImg = pickedImage.resize(size: CGSize(width: 1200, height: 1200 * (pickedImage.size.height / pickedImage.size.width)))
        }
        else if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {   // 원본 이미지가 있을 경우
            sourceImg = pickedImage.resize(size: CGSize(width: 1200, height: 1200 * (pickedImage.size.height / pickedImage.size.width)))
        }
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
    }
    
    

}
