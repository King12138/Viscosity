//
//  VisExampleAnimatedView.swift
//  Example
//
//  Created by WzxJiang on 17/2/6.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

import UIKit

class VisExampleAnimatedView: UIView {
    var redView: UIView!
    var greenView: UIView!
    var blueView: UIView!

    var padding: CGFloat = 10.0
    var animating = false
    
    init() {
        super.init(frame: .null)
        self.createUI()
    }
    
    func createUI() -> Void {
        let padding: CGFloat = 10.0
        let paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding)
        
        redView = UIView.exampleView(color: .red)
        self.addSubview(redView)
        
        greenView = UIView.exampleView(color: .green)
        self.addSubview(greenView)
        
        blueView = UIView.exampleView(color: .blue)
        self.addSubview(blueView)
        
        redView.vis_makeConstraints { (make) in
            make.edges.equalTo(self).insets(paddingInsets).priority(UILayoutPriorityDefaultLow)
            make.bottom.equalTo(blueView.vis_top).offset(-padding)
            make.size.equalTo(greenView)
            make.height.equalTo(blueView)
        }
        
        greenView.vis_makeConstraints { (make) in
            make.edges.equalTo(self).insets(paddingInsets).priority(UILayoutPriorityDefaultLow)
            make.left.equalTo(redView.vis_right).offset(padding)
            make.bottom.equalTo(blueView.vis_top).offset(-padding)
            make.height.equalTo(blueView)
        }
        
        blueView.vis_makeConstraints { (make) in
            make.edges.equalTo(self).insets(paddingInsets).priority(UILayoutPriorityDefaultLow)
        }
    }
    
    override func willMove(toWindow newWindow: UIWindow?) {
        animating = newWindow != nil;
    }
    
    override func didMoveToWindow() {
        self.layoutIfNeeded()
        
        if ((self.window) != nil) {
            animating = true
            self.animate(withInvertedInsets: false)
        }
    }
    
    func animate(withInvertedInsets invertedInsets: Bool) -> Void {
        if (!animating) {
            return
        }
        
        let padding = invertedInsets ? 100 : self.padding;
        let paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding)
        
        redView.vis_updateConstraints { (make) in
            make.edges.equalTo(self).insets(paddingInsets).priority(UILayoutPriorityDefaultLow)
            make.bottom.equalTo(blueView.vis_top).offset(-padding)
        }
        
        greenView.vis_updateConstraints { (make) in
            make.left.equalTo(redView.vis_right).offset(padding)
            make.bottom.equalTo(blueView.vis_top).offset(-padding)
            make.edges.equalTo(self).insets(paddingInsets).priority(UILayoutPriorityDefaultLow)
        }

        
        blueView.vis_updateConstraints { (make) in
            make.edges.equalTo(self).insets(paddingInsets).priority(UILayoutPriorityDefaultLow)
        }

        
        UIView.animate(withDuration: 1, animations: { 
            self.layoutIfNeeded()
        }) { (finished) in
            self.animate(withInvertedInsets: !invertedInsets)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
