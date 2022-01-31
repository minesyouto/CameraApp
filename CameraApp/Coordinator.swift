//
//  Coordinator.swift
//  CameraApp
//
//  Created by みねた on 2022/01/31.
//
//カメラを表示するページ

import SwiftUI
class Coordinator: NSObject, UINavigationControllerDelegate,  UIImagePickerControllerDelegate {
    
    var parent:ImagePicker
    
    init(_ parent:ImagePicker){
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[.originalImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    }
}
