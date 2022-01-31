//
//  ContentView.swift
//  CameraApp
//
//  Created by みねた on 2022/01/31.
//

import SwiftUI

struct ContentView: View {
    @State var image:Image?
    //imageプロパティ => カメラで撮影した画像を表示するためのUI部品
    //imageプロパティには初期値を代入していない => nil
    //アプリの起動直後に表示できる画像がないのでオプショナル型にしている
    @State var isPicking = false
    //isPickingプロパティ => カメラ画面の表示と非表示を切り替えるためのプロパティ
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    //撮影した写真を表示するコード
                    Spacer()
                    image?
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                HStack {
                    //カメラボタンを表示するコード
                    Spacer()
                    Button(action : {
                        self.isPicking = true
                    }) {
                        Image(systemName: "camera")
                        Text("カメラ")
                    }.padding()
                }
            }
            if isPicking {
                //カメラ画面を表示するコード
                ImagePicker()
                    .edgesIgnoringSafeArea(.all)
                //時計などの範囲に干渉できるようにするためのUI部品
                    .transition(.move(edge: .bottom))
                //下からせり上がってくるアニメーション
                //型を省略しない場合の記述 ↓
                //func transition(_ t:AnyTransition) -> some View
                //.moveメソッドは上下左右のいずれかから元の位置へ移動する
                    .animation(.easeInOut)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
