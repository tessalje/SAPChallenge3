//
//  Camera.swift
//  SAPChallenge3
//
//  Created by Tessa Lee on 18/11/25.
//

import SwiftUI
import SwiftData
import UIKit
import PhotosUI

extension Notification.Name {
    static let cameraImageCaptured = Notification.Name("cameraImageCaptured")
}

@Model
class Photo: Identifiable {
    var id = UUID()
    var data: Data
    
    init(id: UUID = UUID(), data: Data) {
        self.data = data
    }
}



struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        picker.cameraCaptureMode = .photo
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    let parent: CameraView
    
    @Published var cameraPermission: Bool = false
    
    init(_ parent: CameraView) {
        self.parent = parent
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        if let image = info[.originalImage] as? UIImage {
            print("Loaded image size:", image.size)
            parent.image = image
            NotificationCenter.default.post(name: .cameraImageCaptured, object: image)
        }
        
        parent.presentationMode.wrappedValue.dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.presentationMode.wrappedValue.dismiss()
    }
    
}
