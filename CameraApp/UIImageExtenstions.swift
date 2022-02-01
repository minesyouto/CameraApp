//
//  UIImageExtenstions.swift
//  CameraApp
//
//  Created by みねた on 2022/02/01.
//
//Swiftフレームワークにはカメラ画面を表示するUI部品がない
//今回はUIImagePickerControllerクラスを使ってカメラ画面を表示している
//なので画像の縦横比が変化して画像が潰れることがある。
//その問題を解決するためのコードをこのファイルに記述する

import UIKit

extension UIImage {
    //extensionを使うことでUIImageクラスに新たな機能を追加できる
    func redraw() -> UIImage {
        //redrawメソッドはUIImageを再描画するメソッド => 引数はなしで戻り値はUIImage型
        let format = UIGraphicsImageRendererFormat()
        //UIGraphicsImageRenderFormatクラスは描画設定をするクラス
        format.scale = 1
        //描画設定として拡大率[scale]を1にする
        return UIGraphicsImageRenderer(size: size, format: format)
            .image { context in
                draw(in: CGRect(origin: .zero, size: size))
    }
}
}
