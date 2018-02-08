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
        view.addSubview(redView)
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor, leading: NSLayoutXAxisAnchor, bottom: NSLayoutYAxisAnchor, trailing: NSLayoutXAxisAnchor, padding: UIEdgeInsets = .zero) {
//        for using my own constrainsts in autolayout
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        leadingAnchor.constraint(equalTo: leading, constant: padding.leading).isActive = true
    }
}
