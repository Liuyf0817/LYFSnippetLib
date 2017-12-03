//
//  QRCode.swift
//  LYFSnippetLib
//
//  Created by 刘艳峰 on 2017/12/3.
//  Copyright © 2017年 Walter. All rights reserved.
//

import UIKit

class QRCode: NSObject {
    func qrImageWithString(str:String) -> UIImage {
        let data = str.data(using: String.Encoding.utf8)
        let filter = CIFilter.init(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "inputMessage")
        let outputImage = filter?.outputImage
        let size:CGFloat = 100
        let extent:CGRect = (outputImage?.extent.integral)!
        let scale:CGFloat = min(size/extent.width, size/extent.height)
        let transform:CGAffineTransform = CGAffineTransform.init(scaleX: scale, y: scale)
        let transformImage:CIImage = (outputImage?.transformed(by: transform))!
        let context:CIContext = CIContext.init(options: nil)
        let imageRef = context.createCGImage(transformImage, from: transformImage.extent)
        let qrCodeImage:UIImage = UIImage.init(cgImage: imageRef!)
        return qrCodeImage
    }
}
