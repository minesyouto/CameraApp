//
//  ImagePicker.swift
//  CameraApp
//
//  Created by みねた on 2022/01/31.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image:Image?
    @Binding var isPicking:Bool
    //@Bindingは親のUI部品のプロパティにアクセスできるようにする
    
    func makeCoordinator() -> Coordinator {
        //このメソッドはUIViewControllerRepresentableプロトコルに宣言されているメソッド。
        //このメソッドはUIKitフレームワークの中のUI部品の調整役となるインスタンス(今回はCoordnatorクラス)を作るためのメソッド。
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        //UIImagePickerControllerというUIKitフレームワークのUI部品をインスタンス化し、そのインスタンスを定数pickerに格納している
        picker.sourceType = .camera
        //画像の取得方法をカメラに指定するコード
        //このコードを省略せずに記述 => picker.sourcetype = UIImagePickerController.SourceType.camera
        //SourceTypeは列挙体の名前。[.camera]が値。
        picker.delegate = context.coordinator
        //delegateプロパティにコーディネータを代入
        //コーディネーターにアクセスするには引数contextを使う => Context型はcoordinatorプロパティをもつ
        //Coordinatorクラスはdelegateプロトコルを批准している(Coodinatorファイル9行目)
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: Context) {
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker(image: .constant(nil), isPicking: .constant(true))
    }
}
