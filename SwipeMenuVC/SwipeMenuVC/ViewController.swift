//
//  ViewController.swift
//  SwipeMenuVC
//
//  Created by Ignatio Julian on 24/11/21.
//

import UIKit
import SwipeMenuViewController

class ViewController: SwipeMenuViewController  {

    private var datas: [String] = ["First","Second", "Third"]
    
    var options = SwipeMenuViewOptions()
    var dataCount: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        options.tabView.style = .segmented
        self.options.tabView.addition = .circle
        self.options.tabView.itemView.selectedTextColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        options.tabView.margin                          = 8.0
//        options.tabView.underlineView.backgroundColor   = UIColor.white
        options.tabView.backgroundColor                 = UIColor(red: 0.18, green: 0.18, blue: 0.18, alpha: 1.00)
//        options.tabView.underlineView.height            = 3.0
        options.tabView.itemView.textColor              = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.00)
        options.tabView.itemView.selectedTextColor      = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
        options.tabView.itemView.margin                 = 10.0
        options.contentScrollView.backgroundColor       = UIColor.lightGray
        options.tabView.isSafeAreaEnabled = true
        options.tabView.height = 60
        self.reload()
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        return dataCount
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

