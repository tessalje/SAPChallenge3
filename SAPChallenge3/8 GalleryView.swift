//
//  8 GalleryView.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 16/11/25.
//

import PhotosUI
import SwiftUI
import UIKit

struct GalleryView: View {
    @State private var selectedImage: UIImage?
    @State private var showingCamera = false
    @State private var selectedPhotos: [PhotosPickerItem] = []
    @State private var images: [UIImage] = []
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
                    if images.isEmpty {
                        Text("No image uploaded")
                            .foregroundStyle(.gray)
                            .padding(.top, 100)
                        
                        HStack {
                            Button(action: {
                                showingCamera = true
                            }) {
                                Text("Take photo")
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 180)
                                    .background(Color.saddarkblue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                            .sheet(isPresented: $showingCamera) {
                                CameraView(image: $selectedImage)
                            }
                            
                            PhotosPicker(selection: $selectedPhotos, matching: .images, photoLibrary: .shared()) {
                                Text("Select Photo")
                                    .font(.headline)
                                    .padding()
                                    .frame(width: 180)
                                    .background(Color.sadturquoise)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                
                            }
                            .onChange(of: selectedPhotos) { newItems in
                                Task {
                                    images.removeAll()
                                    for item in newItems {
                                        if let data = try? await item.loadTransferable(type: Data.self) {
                                            if let uiImage = UIImage(data: data) {
                                                images.append(uiImage)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                    } else {
                        LazyVGrid(columns: columns) {
                            ForEach(images, id: \.self) { uiImage in
                                ZStack(aligntment: .topTrailing) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .frame(width: 200, height: 150)
                                        .cornerRadius(5)
                                    
//                                    Button(action: {
//                                        images.remove(at: index)
//                                    }) {
//                                        Image(systemName: "trash")
//                                            .foregroundColor(.red)
//                                            .shadow(radius: 4)
//                                    }
                                
                                }
                            }
                            
                        }
                        .padding(.top, 60)
                        
                    }
                    
                }
            }
            .navigationTitle("Art Gallery")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add", systemImage: "camera") {
                        showingCamera = true
                    }
                    .sheet(isPresented: $showingCamera) {
                        CameraView(image: $selectedImage)
                    }
                }
            }
        }
    }
}

#Preview {
    GalleryView()
}

