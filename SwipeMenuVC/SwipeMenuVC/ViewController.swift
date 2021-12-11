//
//  ViewController.swift
//  SwipeMenuVC
//
//  Created by Ignatio Julian on 24/11/21.
//

import UIKit
import SwipeMenuViewController

class ViewController: SwipeMenuViewController  {

    private var datas: [String] = ["All","For You"]
    
    var options = SwipeMenuViewOptions()
//    var dataCount: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Notifications"
        
        options.tabView.style = .segmented
        self.options.tabView.addition = .underline
        options.tabView.margin                          = 8.0
        options.tabView.additionView.underline.height   = 2.0
        options.tabView.additionView.backgroundColor    = UIColor.red
        options.tabView.backgroundColor                 = UIColor(ciColor: .clear)
        options.tabView.itemView.textColor              = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        options.tabView.itemView.selectedTextColor      = UIColor.blue
        options.tabView.itemView.margin                 = 10.0
        options.contentScrollView.backgroundColor       = UIColor.lightGray
        options.tabView.isSafeAreaEnabled = true
        options.tabView.height = 50
        self.reload()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func reload() {
        swipeMenuView.reloadData(options: options)
    }
    
    // MARK: - SwipeMenuViewDelegate
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewWillSetupAt currentIndex: Int) {
        print("will setup SwipeMenuView")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewDidSetupAt currentIndex: Int) {
        print("did setup SwipeMenuView")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, willChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        print("will change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, didChangeIndexFrom fromIndex: Int, to toIndex: Int) {
        print("did change from section\(fromIndex + 1)  to section\(toIndex + 1)")
    }
    
    
    // MARK - SwipeMenuViewDataSource
    
    override func numberOfPages(in swipeMenuView: SwipeMenuView) -> Int {
        return datas.count
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, titleForPageAt index: Int) -> String {
        return datas[index]
    }
    
    override func swipeMenuView(_ swipeMenuView: SwipeMenuView, viewControllerForPageAt index: Int) -> UIViewController {
        
        switch index {
        case 0:
            let vc:FirstViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
            addChild(vc)
            return vc
        case 1:
            let vc:SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
            addChild(vc)
            return vc
        case 2:
            let vc:ThirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            addChild(vc)
            return vc
        default:
            let vc:FirstViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
            addChild(vc)
            return vc
        }
    }
}

