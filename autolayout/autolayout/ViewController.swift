//
//  ViewController.swift
//  autolayout
//
//  Created by Sky Xu on 2/7/18.
//  Copyright © 2018 Sky Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redView = UIView()
        redView.backgroundColor = .red
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 125, height: 0))
//        make the height equal to width
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor)
//        make the size of blueview the same as red
        blueView.anchorSize(to: redView)
        
//        greenview is bigger view on the left
        let greenView = UIView()
        greenView.backgroundColor = .green
        greenView.anchor(top: redView.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: redView.bottomAnchor, trailing: redView.leadingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
        
        let purpleView = UIView()
        purpleView.backgroundColor = .purple
        purpleView.fillSuper()
        
        // add all views to this vc
        [purpleView, redView, blueView, greenView].forEach { view.addSubview($0) }
    }
}

extension UIView {
    
//    fill the superview with one view (define constraint relationship toward superview)
    func fillSuper() {
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
//    define the size constraint realted to another view
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
//    define constraints (top, leading, bottom, padding, size)
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
//        for using my own constrainsts in autolayout
        translatesAutoresizingMaskIntoConstraints = false
        
//        if lets to check if the values exsit caz we set them to be optional to allow better flexibility
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
//        check if width and height property of size is nonezero, then we set width and height constraint to view
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
    }
}
