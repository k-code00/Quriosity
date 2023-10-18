//
//  ImageUploader.swift
//  Q?
//
//  Created by kojo on 15/10/2023.
//

import UIKit
import FirebaseStorage
import Firebase

// This struct provides functionality to upload an image to a storage service.
struct ImageUploader {
    
    // Static function to upload an image and get the URL once the upload is complete.
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        
        // Convert the UIImage to JPEG data with 50% compression quality.
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        // Generate a unique filename using a UUID.
        let filename = NSUUID().uuidString
        
        // Create a reference to the location where we want to upload the image in the storage.
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        // Upload the image data to the specified location.
        ref.putData(imageData, metadata: nil) { _, error in
            
            // Check if there was an error during the upload.
            if let error = error {
                print("DEBUG: Failed To Upload Image With Error: \(error.localizedDescription)")
                return
            }
            
            // If upload was successful, get the download URL of the uploaded image.
            ref.downloadURL { imageUrl, _ in
                // Ensure that the URL is valid.
                guard let imageUrl = imageUrl?.absoluteString else { return }
                
                // Call the completion handler with the image URL.
                completion(imageUrl)
            }
        }
    }
}

