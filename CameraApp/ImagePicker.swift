//
//  ImagePicker.swift
//  CameraApp
//
//  Created by みねた on 2022/01/31.
//
//写真ライブラリを表示するためのページ

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
}
    

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}
