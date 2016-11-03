//
//  MenuViewController.swift
//  D'Andrea Visual Communications
//
//  Created by Andrew Olson on 10/24/16.
//  Copyright © 2016 Valhalla Applications. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var aboutButton: UIButton!
    var menuView: MenuView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        menuView = MenuView(frame: self.view.frame)
        self.view.addSubview(menuView)
        setOrientationNotification()
        print("Menu did load")
    }
    private func setOrientationNotification()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRotate(sender:)), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    func didRotate(sender: Any)
    {
        for view in self.view.subviews
        {
            if let subView = view as? MenuView
            {
                subView.removeFromSuperview()
            }
        
        }
        menuView = MenuView(frame: self.view.frame)
        view.addSubview(menuView)
        print("Did Rotate")
    }
}
class MenuView: UIView {
    var aboutButton = UIButton(type: .system)
    var contactButton = UIButton(type: .system)
    private var viewFrame: CGRect!
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        initialize()
    }
    
    func initialize()
    {
        configureButtons()
        print("Initialize")
    }
    //TODO: Clean this up some time.
    func configureButtons()
    {
        //Style the button
        aboutButton = UIButton(type: .custom)
        aboutButton.setTitle("Our Story", for: .normal)
        aboutButton.titleLabel?.textColor = .white
        aboutButton.setTitleColor(.blue, for: .highlighted)
        let font = UIFont(name: "Avenir", size: 24)
        aboutButton.titleLabel?.font = font
        
        //Set the frame
        aboutButton.frame = CGRect(x: 0, y: 0 , width: self.frame.width - 20, height: 100)
        aboutButton.addTarget(self, action: #selector(aboutButtonAction(sender:)), for: .touchUpInside)
        
        //Style the button
        contactButton = UIButton(type: .custom)
        contactButton.setTitle("Contact Us", for: .normal)
        contactButton.titleLabel?.textColor = .white
        contactButton.setTitleColor(.blue, for: .highlighted)
        contactButton.titleLabel?.font = font
        
        //Set the frame
        contactButton.frame = CGRect(x: 0, y: aboutButton.frame.maxY + 5 , width: self.frame.width - 20, height: 100)
        contactButton.addTarget(self, action: #selector(contactButtonAction(sender:)), for: .touchUpInside)
        print(frame)
        //Add to the View
        addSubview(aboutButton)
        addSubview(contactButton)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        initialize()
        print("Layout menu")
    }
    func aboutButtonAction(sender: UIButton)
    {
        print("About Action.")
    }
    func contactButtonAction(sender: UIButton)
    {
        print("Contact Action.")
    }
    
}
