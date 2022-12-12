//
//  AlamoImage.swift
//  imageloader
//
//  Created by Abby Dominguez on 12/12/22.
//

import UIKit
import RxAlamofire
import Alamofire
import RxSwift

class AlamoImage: UIImageView{
    func imageFromUrl(urlString: String) {
        requestData(.get, urlString)
            .observeOn(MainScheduler.instance)
            .subscribe{ self.image = UIImage(data: $0.1) }
    }
}
