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
    //imageはオプショナルImage型 => アプリを起動した際は表示できる画像がないためnil => オプショナル型
    //imageは初期値を代入していない
    //@Stateで自動再描画
    @State var isPicking = false
    //カメラ画面の表示と非表示を切り替えるプロパティ
    //true => カメラ画面を表示 false => 非表示
    var body: some View {
        ZStack { //ZStackでUI部品の前後の位置関係を設定
            VStack { //カメラ画面が非表示の際の画面 => 前後関係では後ろにある
                VStack {
                    Spacer() //UI部品とUI部品の間に空白を作るUI部品
                    image? //nilの可能性があるオプショナル型の変数から値を取り出すには変数名の後に[?]をつける
                        .resizable()
                        .scaledToFit()
                    Spacer()
                }
                HStack { //カメラアイコンとボタンを平行に並べている
                    Spacer() //Spacerでボタンの左側に余白を設定
                    Button(action: {
                        self.isPicking = true //ボタンがタップされると Button構造体のイニシャライザの引数actionに指定した
                                              //クロージャが実行される。
                                              //このクロージャはisPickingプロパティをtrueで上書きする
                    }) {
                        Image(systemName: "camera")
                        Text("カメラ")
                    }.padding() //ボタンを押しやすいようにpaddingを設定
                }
            }
            if isPicking { //カメラ画面 => モーダルで表示　=> 前後関係では前にある
                ImagePicker(image: $image, isPicking: $isPicking)
                //@Stateのついたプロパティの値は[$]をつけて渡す
                    .edgesIgnoringSafeArea(.all)
                    .transition(.move(edge: .bottom))
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
