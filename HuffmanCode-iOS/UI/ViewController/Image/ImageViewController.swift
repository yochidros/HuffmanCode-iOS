//
//  ImageViewController.swift
//  HuffmanCode-iOS
//
//  Created by 宮澤賢生 on 2017/09/02.
//  Copyright © 2017年 yochio. All rights reserved.
//

import UIKit
import SDWebImage

class ImageViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var doubleTapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Image"
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1.0
        scrollView.delegate = self
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.addTarget(self, action: #selector(doubleTap(gesture:)))
        imageView.isUserInteractionEnabled = true
        
        if let imageData = HuffmanModel.share.responseData {
            let imageURL = "https://s3-ap-northeast-1.amazonaws.com/projecthuffmancode/images/" + imageData.imageName
            imageView.sd_setImage(
                with: URL(string: imageURL),
                placeholderImage: nil,
                options: [.highPriority],
                completed: { [weak imageView] (image, error, _, _) in
                    if image != nil {
                        imageView?.image = image
                    } else {
                        self.showErrorAlert()
                        
                    }
            })
        } else {
            self.showErrorAlert()
        }
    }
    
    private func showErrorAlert() {
        let alert = UIAlertController(title: "Failed",
                                      message: "Sorry, couldn't get image\n back previous page.",
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func doubleTap(gesture: UITapGestureRecognizer) -> Void {
        if ( self.scrollView.zoomScale < 3 ) {
            let newScale:CGFloat = self.scrollView.zoomScale * 3
            let zoomRect:CGRect = self.zoomRectForScale(scale: newScale, center: gesture.location(in: gesture.view))
            self.scrollView.zoom(to: zoomRect, animated: true)
            
        } else {
            self.scrollView.setZoomScale(1.0, animated: true)
        }
    }
    
    func resetZoom(){
        self.scrollView.setZoomScale(1.0, animated: false)
    }
    
    private func zoomRectForScale(scale:CGFloat, center: CGPoint) -> CGRect{
        var zoomRect: CGRect = CGRect()
        zoomRect.size.height = self.scrollView.frame.size.height / scale
        zoomRect.size.width = self.scrollView.frame.size.width / scale
        
        zoomRect.origin.x = center.x - zoomRect.size.width / 2.0
        zoomRect.origin.y = center.y - zoomRect.size.height / 2.0
        
        return zoomRect
    }
}

extension ImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}

