//
//  UIImageView+Extension.swift
//  iMDB
//
//  Created by Francisco Jasso on 23/02/25.
//

import UIKit

extension UIImageView {
    func getPoster(from path: String) {
        //This function gets the image from the URL
        guard let url = URL(string: "\(Constants.postersURL)\(path)") else {
            return
        }
        
        //Using URL sesion to avoid performance loss
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
            }
        }.resume()
    }
}
