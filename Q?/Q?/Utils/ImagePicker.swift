//
//  ImagePicker.swift
//  Q?
//
//  Created by kojo on 15/10/2023.
//

import SwiftUI

// This struct provides a SwiftUI view that represents a UIKit-based image picker.
struct ImagePicker: UIViewControllerRepresentable {
    
    // A binding to an external UIImage property. This will be updated with the selected image.
    @Binding var selectedImage: UIImage?
    
    // Retrieves the presentation mode of the current view. Used to programmatically dismiss the image picker.
    @Environment(\.presentationMode) var presentationMode
    
    // Creates and returns the coordinator that acts as a bridge between UIKit and SwiftUI.
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    // Creates and returns a UIImagePickerController. This function is called when SwiftUI wants to display the UIKit controller.
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator // Setting the coordinator as the delegate to handle image picker events.
        return picker
    }
    
    // Updates the state of the presented UIViewController. In this case, we don't need to do any updating, so it's empty.
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension ImagePicker {
    // Coordinator class that acts as the delegate for the UIImagePickerController.
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        // Reference back to the main ImagePicker SwiftUI view.
        let parent: ImagePicker
        
        // Initializer that sets the parent property.
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        // This function is called when an image is selected from the picker.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            // Extracting the selected image from the info dictionary.
            guard let image = info[.originalImage] as? UIImage else { return }
            
            // Updating the selectedImage property of the parent SwiftUI view with the chosen image.
            parent.selectedImage = image
            
            // Dismissing the image picker.
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
