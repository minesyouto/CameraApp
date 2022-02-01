//
//  Coordinator.swift
//  CameraApp
//
//  Created by みねた on 2022/01/31.
//

import SwiftUI
class Coordinator: NSObject, UINavigationControllerDelegate,  UIImagePickerControllerDelegate { //Coordinatorクラスを宣言
    //子クラス <= [:] => 親クラス
    //クラスを簡潔にまとめると、親クラスのメソッドやプロパティを子クラスでも使えるようにするもの
    //UINavigatitonControllerDelegateプロトコルとUIImagepickerControllerDelegateプロトコルを批准するためにNSObjectクラスを継承している
    
    var parent:ImagePicker
    //parentプロパティにはImagePickerのインスタンスへの参照(住所)が格納される。
    //初期値は代入されていない
    //parentプロパティの中にImagePickerのインスタンスを持つことでImagePickerを参照する。
    
    init(_ parent:ImagePicker){ //これがイニシャライザ
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //撮影した画像をライブラリに保存するコード
        let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //infoはSwiftで設定されている辞書。
        //UIImagePickerController(クラス) => InfoKey(構造体) => originalImage(タイププロパティ)
        //Swiftでは.originalImage まで省略できる。
        
        //辞書Infoから出した画像データはAny型で画像や撮影時刻など色々な型のデータが格納されている。
        //なので辞書Infoから取得する画像を事前にAny型からUIImage型にタイプキャスティング(型の変換)を行う。
        //タイプキャスティング => 値 as! 型
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
        parent.image = Image(uiImage: uiImage.redraw())
        parent.isPicking = false
        //画像を写真アルバムに保存する関数
        //第一引数ではUIImage型の画像を指定
        //第2〜4引数では画像保存後にする処理を指定 => 今回は何も処理しないので全てnil
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //撮影をキャンセルするメソッド
        parent.isPicking = false
    }
}
