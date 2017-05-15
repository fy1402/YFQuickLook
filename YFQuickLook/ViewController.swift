//
//  ViewController.swift
//  YFQuickLook
//
//  Created by 丰雨 on 2017/5/9.
//  Copyright © 2017年 Feng. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UIViewController {

    var dataArray: [URL]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let pdfPath = Bundle.main.path(forResource: "oh0", ofType: "pdf")
        let url = URL(fileURLWithPath: pdfPath!)
        
        let pdfPath1 = Bundle.main.path(forResource: "oh1", ofType: "pdf")
        let url1 = URL(fileURLWithPath: pdfPath1!)
        
        let pdfPath3 = Bundle.main.path(forResource: "oh2", ofType: "xlsx")
        let url2 = URL(fileURLWithPath: pdfPath3!)
        
        let pdfPath4 = Bundle.main.path(forResource: "oh3", ofType: "docx")
        let url3 = URL(fileURLWithPath: pdfPath4!)
        
        dataArray = [url, url1, url2, url3]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var open: UIButton!

    @IBAction func openQL(_ sender: Any) {
        let qlPreview = YFPreviewController()
        qlPreview.delegate = self
        qlPreview.dataSource = self
        self.present(qlPreview, animated: true, completion: nil)
    }
}

extension ViewController: QLPreviewControllerDelegate {
    
    func previewController(_ controller: QLPreviewController, frameFor item: QLPreviewItem, inSourceView view: AutoreleasingUnsafeMutablePointer<UIView?>) -> CGRect {
        return CGRect(x: 100, y: 100, width: 100, height: 100)
    }
    
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        print("will dismiss")
    }
    
    func previewControllerDidDismiss(_ controller: QLPreviewController) {
        print("did dismiss")
    }
    
    func previewController(_ controller: QLPreviewController, shouldOpen url: URL, for item: QLPreviewItem) -> Bool {
        print("show open \(url)")
        return true
    }
    
    func previewController(_ controller: QLPreviewController, transitionImageFor item: QLPreviewItem, contentRect: UnsafeMutablePointer<CGRect>) -> UIImage {
        return UIImage()
    }
}

extension ViewController: QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return (self.dataArray?.count)!
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        return self.dataArray![index] as QLPreviewItem
    }
}

