//
//  8 GalleryView.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 16/11/25.
//

import PhotosUI
import SwiftUI
import UIKit
import SwiftData

struct GalleryView: View {
    @State private var selectedImage: UIImage?
    @State private var showingCamera = false
    @State private var selectedPhotos: [PhotosPickerItem] = []
    @Environment(\.modelContext) var modelContext
    @Query var images: [Photo]
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Homepage")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                ScrollView {
//                    if images.isEmpty {
//                        Text("No image uploaded")
//                            .foregroundStyle(.gray)
//                            .padding(.top, 100)
//                        
//                        HStack {
//                            Button(action: {
//                                showingCamera = true
//                            }) {
//                                Text("Take photo")
//                                    .font(.headline)
//                                    .padding()
//                                    .frame(width: 180)
//                                    .background(Color.saddarkblue)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(10)
//                            }
//                            
//                            PhotosPicker(selection: $selectedPhotos, matching: .images, photoLibrary: .shared()) {
//                                Text("Select Photo")
//                                    .font(.headline)
//                                    .padding()
//                                    .frame(width: 180)
//                                    .background(Color.sadturquoise)
//                                    .foregroundColor(.white)
//                                    .cornerRadius(10)
//                            }
//                        }
//                    } else {
                        LazyVGrid(columns: columns) {
                                ForEach(images, id: \.self) { photo in
                                    if let uiImage = UIImage(data: photo.data) {
                                        ZStack(alignment: .topTrailing) {
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 190, height: 150)
                                                .cornerRadius(5)
                                            Button(action: {
                                                modelContext.delete(photo)
                                            }) {
                                                Image(systemName: "trash")
                                                    .foregroundStyle(.red)
                                                    .font(.system(size: 20))
                                                    .padding(8)
                                            }
                                            
                                        }
                                    }
                                }
                        }
                        .padding(.top, 60)
                        
//                    }
                    
                }
            }
            .navigationTitle("Art Gallery")
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Button("Add", systemImage: "camera") {
                            showingCamera = true
                        }
                        
                        PhotosPicker(selection: $selectedPhotos, matching: .images, photoLibrary: .shared()) {
                            Image(systemName: "photo")
                        }
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: HomescreenView()) {
                        Image(systemName: "house")
                    }
                }
            }
            .sheet(isPresented: $showingCamera) {
                CameraView(image: $selectedImage)
            }
            .onChange(of: selectedImage) {
                if let selectedImage, let data = selectedImage.pngData() {
                    savePics(data: data)
                }
            }
            .onChange(of: selectedPhotos) { newItems in
                Task {
                    for item in newItems {
                        if let data = try? await item.loadTransferable(type: Data.self) {
                            savePics(data: data)
                        }
                    }
                }
            }
        }
    }
    func savePics(data: Data) {
        let photo = Photo(data: data)
        modelContext.insert(photo)
    }
}

#Preview {
    GalleryView()
}

