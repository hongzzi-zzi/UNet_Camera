//
//  ContentView.swift
//  UNet_camera
//
//  Created by 안홍은 on 2022/07/11.
//

import SwiftUI
struct ContentView: View {
//
//    // show image
//    @State private var image = UIImage.init(named:"test.jpg")!
    @State private var image = UIImage()

    // camera
    @State private var isCamera = false

    // photo booth
    @State private var isPhotobooth = false

    // upload
    @State private var isUpload = false
    
    // save
    @State private var isSave = false
    
    var body: some View {
        VStack {
            // show image
            Image(uiImage: self.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .padding()
//
            Spacer()
            // server button
            HStack{
                // camera button
                Button{
                    self.isCamera = true
                 }label: {
                     Image(systemName: "camera")
                     Text("Camera")
                 }
                // photo button
                Button{
                    self.isPhotobooth = true
                 }label: {
                     Image(systemName: "photo")
                     Text("Photo")
                 }
                
                // save button
                Button{
                    self.isSave = true
                 }label: {
                     Image(systemName: "square.and.arrow.down")
                     Text("Save")
                 }
                 
            }.padding()
            Spacer()
            Spacer()
            
//            HStack{
//                // upload button
//                Button{
//                    self.isUpload = true
//                 }label: {
//                     Image(systemName: "square.and.arrow.up")
//                     Text("Upload").bold()
//                 }.padding()
//
//                // save button
//                Button{
//                    self.isSave = true
//                 }label: {
//                     Image(systemName: "square.and.arrow.down")
//                     Text("Save").bold()
//                 }
//                 .padding()
//            }
            
        }
        .buttonStyle(.bordered)
        .sheet(isPresented: $isCamera) {
            ImagePicker(sourceType: .camera, selectedImage: self.$image)
            
                }
        .sheet(isPresented: $isPhotobooth) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                }
//        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
//        출처: https://trend21c.tistory.com/1631 [나를 찾는 아이:티스토리]
        
//        .sheet(isPresented: $isUpload) {
//            let _ = ViewController.handleServerTap(ViewController)
//        }
        
        .sheet(isPresented: $isSave) {
            let _ = UIImageWriteToSavedPhotosAlbum(self.image, self, nil, nil);
        }

    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
