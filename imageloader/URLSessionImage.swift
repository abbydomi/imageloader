//
//  AsyncImageView.swift
//  StoryboardMusicTable
//
//  Created by Abby Dominguez on 7/10/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class URLSessionImage: UIImageView{
    
    var task: URLSessionDataTask!
    let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    func asyncLoad(from url: URL){
        image = nil
        addSpinner()
        if let task = task {
            task.cancel()
        }
        //Check if the cache has the image already
        if let imageFromCache = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            image = imageFromCache
            removeSpinner()
            return
        }
        //No cache, download image and add it to the cache
        task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                let newImage = UIImage(data: data) else {
                print("couldn't load image from url : \(url)")
                return
            }
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            DispatchQueue.main.async {
                self.image = newImage
                self.removeSpinner()
            }
        }
        task.resume();
    }
    
    func addSpinner(){
        addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        spinner.startAnimating()
    }
    
    func removeSpinner(){
        spinner.removeFromSuperview();
    }
}
