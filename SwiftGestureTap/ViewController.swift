//
//  ViewController.swift
//  SwiftGestureTap
//
//  Created by 岩本果純 on 2016/07/15.
//  Copyright © 2016年 KasumiIwamoto. All rights reserved.
//

//test
import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var myImageView: UIImageView!
    @IBAction func tapImageView(sender: UITapGestureRecognizer) {
        let gpos = sender.locationInView(self.view)
        let pos = sender.locationInView(myImageView)
        print("gpos = \(gpos)")
        print("pos = \(pos)")
        myImageView.image = makeUIImage(myImageView.image, pos)
    }
    func makeUIImage(image: UIImage?, _ pos:CGPoint) -> UIImage {
        let sz:CGSize = myImageView.frame.size
        UIGraphicsBeginImageContext(sz)
        let context: CGContextRef = UIGraphicsGetCurrentContext()!
        if image != nil {
            image!.drawInRect(CGRectMake(0,0,image!.size.width,image!.size.height))
        }
        CGContextSetLineWidth(context, 4.0)
        CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0)
        CGContextAddRect(context, CGRectMake(pos.x-5,pos.y-5,10,10))
        CGContextStrokePath(context)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

