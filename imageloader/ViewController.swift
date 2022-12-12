//
//  ViewController.swift
//  imageloader
//
//  Created by Abby Dominguez on 12/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageData: DataImage!
    @IBOutlet weak var imageAlamo: AlamoImage!
    @IBOutlet weak var imageURLSession: URLSessionImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Data
        imageData.downloadImage(from: URL(string: "https://images.genius.com/c4932f90ec364cd9f841d707a8db06c5.700x700x1.jpg")!)
        //URLSession
        imageURLSession.asyncLoad(from: URL(string: "https://images.genius.com/24df596c2e657d773c3e6bc9477a1a25.1000x1000x1.jpg")!)
        
        //Alamofire
        imageAlamo.imageFromUrl(urlString: "https://t2.genius.com/unsafe/600x600/https://images.genius.com/eae7745edb096f44cccfd9123e52a4f1.1000x1000x1.png")
    }


}

