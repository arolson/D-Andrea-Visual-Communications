//
//  HomeViewController.swift
//  D'Andrea Visual Communications
//
//  Created by Andrew Olson on 10/24/16.
//  Copyright © 2016 Valhalla Applications. All rights reserved.
//

import UIKit
//Note to self turned off screen orientation
class HomeViewController: UIViewController {
    
    //MARK: Inset Views
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var presentingView: UIView!
    @IBOutlet weak var addressView: UIView!
    
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleBarImage: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var menu: MenuViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load: \n \n")
        setTitleIcon()
        let addressText = "6100 Gateway Drive \nCypress, CA 90630 \n(714) 947-8444"
        textView.text = addressText
    }
    override func viewWillAppear(_ animated: Bool) {

        addContentToView()
    }
    func addContentToView()
    {
        let vc: ContentViewController = self.storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        vc.topString = "D'Andrea Visual \nCommunications "
        vc.image = UIImage(named: "Building")
        
        vc.view.frame = contentView.frame
        
        contentView.addSubview(vc.view)
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


