//
//  MainViewController.swift
//  D'Andrea Visual Communications
//
//  Created by Andrew Olson on 10/24/16.
//  Copyright © 2016 Valhalla Applications. All rights reserved.
//

import UIKit
//Note to self turned off screen orientation
class MainViewController: UIViewController {
    
    @IBOutlet weak var presentingView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleBarImage: UIImageView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var menu: MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load: \n \n")
        setTitleIcon()
    }
    
    @IBAction func menuAction(_ sender: AnyObject) {
        let menuFrame = CGRect(x: 0, y: 0 , width: presentingView.frame.maxX, height: presentingView.frame.height)
        
        if menuButton.tag == 0
        {
            menu = MenuViewController()
            menu.view.frame = menuFrame.offsetBy(dx: -self.view.frame.maxX, dy: 0)
            
            toggleMenuView(frame: menuFrame)
            presentingView.addSubview((menu.view)!)
            
            menuButton.tag = 1
            print("open menu")
        }
        else
        {
            toggleMenuView(frame: menuFrame.offsetBy(dx: -self.view.frame.maxX, dy: 0))
            
            menuButton.tag = 0
            print("close menu")
        }
    }
    
    /* MenuView Toggling */
    func toggleMenuView(frame: CGRect)
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.menu.view.frame = frame
        })
    }
    
    
    /*MARK: Navigation Bar Customization*/
    func setTitleIcon()
    {
        let titleImage = UIImage(named: "NavigationBarLogo")
        titleBarImage.image = titleImage
    }
}


