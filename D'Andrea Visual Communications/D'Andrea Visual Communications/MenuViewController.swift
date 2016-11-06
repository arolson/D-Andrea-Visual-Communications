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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setMenuConstraints()
    }
    func setMenuConstraints()
    {
        setConstraints(button: menuView.aboutButton, ancoreView: self.view)
        setConstraints(button: menuView.contactButton, ancoreView: menuView.aboutButton)
        setConstraints(button: menuView.calculatorButton, ancoreView: menuView.contactButton)
    }
    func setConstraints(button: UIButton, ancoreView: UIView)
    {
        let margins = ancoreView.layoutMarginsGuide
        button.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalTo: button.heightAnchor)
    }
    private func setOrientationNotification()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRotate(sender:)), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    func didRotate(sender: Any)
    {
//        for view in self.view.subviews
//        {
//            if let subView = view as? MenuView
//            {
//                subView.removeFromSuperview()
//            }
//        
//        }
//        menuView = MenuView(frame: self.view.frame)
//        view.addSubview(menuView)
        print("Did Rotate")
    }
}
class MenuView: UIView {
    var aboutButton: UIButton!
    var contactButton: UIButton!
    var calculatorButton: UIButton!
    
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
        //About button:
        var frame = CGRect(x: 0, y: 0 , width: self.frame.width, height: 100)
        aboutButton = menuButton(title: "Our Story", textColor: .white, highlightedColor: .gray, frame: frame)
        //add the Target Action
        aboutButton.addTarget(self, action: #selector(aboutButtonAction(sender:)), for: .touchUpInside)
        
        
        
        //Contact button:
        frame = CGRect(x: 0, y: aboutButton.frame.maxY + 5 , width: self.frame.width, height: 100)
        contactButton = menuButton(title: "Contact Us", textColor: .white, highlightedColor: .gray, frame: frame)
        //add the target
        contactButton.addTarget(self, action: #selector(contactButtonAction(sender:)), for: .touchUpInside)
        //set constraints
        
        
        //Calculator Button:
        frame = CGRect(x: 0, y: contactButton.frame.maxY + 5 , width: self.frame.width, height: 100)
        calculatorButton = menuButton(title: "Calculator", textColor: .white, highlightedColor: .gray, frame: frame)
        //add the target
        calculatorButton.addTarget(self, action: #selector(calculatorButtonAction(sender:)), for: .touchUpInside)
        
        
        //Add to the View
        addSubview(aboutButton)
        addSubview(contactButton)
        addSubview(calculatorButton)
    }
    func menuButton(title: String, textColor: UIColor, highlightedColor: UIColor, frame: CGRect)->UIButton
    {
        let button: UIButton = UIButton(type: .custom)
        //Custom styling
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = textColor
        button.setTitleColor(highlightedColor, for: .highlighted)
        let font = UIFont(name: "Avenir", size: 24)
        button.titleLabel?.font = font
        //set the frame
        button.frame = frame
    
        return button
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
    func calculatorButtonAction(sender: UIButton)
    {
        print("Image Claculator.")
    }
    
}










