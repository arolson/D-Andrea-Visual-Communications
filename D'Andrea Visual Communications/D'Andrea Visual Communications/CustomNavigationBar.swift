//
//  CustomNavigationBar.swift
//  D'Andrea Visual Communications
//
//  Created by Andrew Olson on 10/24/16.
//  Copyright © 2016 Valhalla Applications. All rights reserved.
//

//This site was a great help: http://www.emdentec.com/blog/2014/2/25/hacking-uinavigationbar
//From: Febuary 27, 2014
import UIKit

class CustomNavigationBar: UINavigationBar
{
    //the height you want your navigation bar to be.
    private let desiredHeight: CGFloat = 80
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width, height:  desiredHeight - 15)
        
        let height: CGFloat = desiredHeight - 44
        //setTitleVerticalPositionAdjustment(-10, for: .default)
        let shift:CGFloat = height / 2
        ///Move the background down for [shift] point
        let classNamesToReposition: [String] = ["_UINavigationBarBackground"]
        for view: UIView in self.subviews {
            if classNamesToReposition.contains(NSStringFromClass(type(of: view))) {
                let bounds: CGRect = self.bounds
                var frame: CGRect = view.frame
                frame.origin.y = bounds.origin.y + shift - 20.0
                frame.size.height = bounds.size.height + 20.0
                view.frame = frame
                print("Navigation bar changed")
            }
        }
        print("Layout Subviews.")
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize
    {
        let amendedSize:CGSize = super.sizeThatFits(size)
        let newSize:CGSize = CGSize(width: amendedSize.width, height: desiredHeight)
        
        return newSize
    }
}
