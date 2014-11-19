//
//  HolderViewController.swift
//  SeparateTarbarSample
//
//  Created by don on 11/17/14.
//  Copyright (c) 2014 donstudio. All rights reserved.
//

import UIKit

class PlaceholderViewController: UIViewController {

    var storyboardViewController : UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func instantiateViewControllerFromStoryboard()  -> UIViewController {
        var storyboard : UIStoryboard?
        if var identifier = self.restorationIdentifier {
            storyboard = UIStoryboard(name: identifier, bundle: nil)
        }

        let ret = storyboard?.instantiateInitialViewController() as UIViewController
        return storyboard?.instantiateInitialViewController() as UIViewController
    }
    
    
    override func loadView() {
        super.loadView()
        
        if self.storyboardViewController == nil {
            self.storyboardViewController = self.instantiateViewControllerFromStoryboard()
        }
        
        if (self.storyboardViewController != nil && self.navigationController != nil) {
            let idx = indexOfObject((self.navigationController?.viewControllers)!, vc: self)
            if idx != NSNotFound {
                var viewControllers = NSMutableArray(array: (self.navigationController?.viewControllers)!)
                println(self.storyboardViewController)
                viewControllers.replaceObjectAtIndex(idx, withObject: self.storyboardViewController!)
                self.navigationController?.setViewControllers(viewControllers, animated: false)
            }
        }
    }

    
    func indexOfObject(arr : [AnyObject], vc : UIViewController) -> Int{
        for (index, item) in enumerate(arr) {
            if item is UIViewController && item as UIViewController == vc {
                return index
            }
        }
        return NSNotFound
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
