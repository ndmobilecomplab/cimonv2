//
//  RootViewControoler.swift
//  PagingMenuControllerDemo
//
//  Created by Cheng-chien Kuo on 5/14/16.
//  Copyright © 2016 kitasuke. All rights reserved.
//

import UIKit
//import PagingMenuController

struct PagingMenuOptions: PagingMenuControllerCustomizable {
    //private let viewController = UIStoryboard(name: "Label", bundle: nil).instantiateViewController(withIdentifier: "moodvc") as UIViewController
    //private let viewController1 = UIStoryboard(name: "Label", bundle: nil).instantiateViewController(withIdentifier: "activityvc") as UIViewController
    //private let viewController2 = UIStoryboard(name: "Label", bundle: nil).instantiateViewController(withIdentifier: "contextvc") as UIViewController
    private let viewController = UIStoryboard(name: "Label", bundle: nil).instantiateViewController(withIdentifier: "testlabelcollectionvc") as! TestLabelCollectionViewController
    private let viewController1 = UIStoryboard(name: "Label", bundle: nil).instantiateViewController(withIdentifier: "testlabelcollectionvc") as! TestLabelCollectionViewController
    private let viewController2 = UIStoryboard(name: "Label", bundle: nil).instantiateViewController(withIdentifier: "testlabelcollectionvc") as! TestLabelCollectionViewController
    //private let viewController3 = UIStoryboard(name: "Label", bundle: nil).instantiateViewController(withIdentifier: "testlabelcollectionvc") as UIViewController
    
    
    
    internal var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
        viewController.initData(labels: ["Angry", "SAD", "HAPPY", "EXCITED", "ANNOYED", "ANXIOUS"])
        viewController1.initData(labels: ["Sitting", "STANDING", "RUNNING", "WALKING", "BIKING", "LAY DOWN"])
        viewController2.initData(labels: ["HOME", "WORK", "SCHOOL", "STORE", "COMMUTING", "OTHER"])
        return [viewController, viewController1, viewController2]
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            //return .standard(widthMode: MenuItemWidthMode.flexible, centerItem: true, scrollingMode: MenuScrollingMode.scrollEnabled)
            //return .segmentedControl
            return .infinite(widthMode: MenuItemWidthMode.flexible, scrollingMode: MenuScrollingMode.scrollEnabled)
        }
        var dummyItemViewsSet: Int{
            return 3
        }
        
        var itemsOptions: [MenuItemViewCustomizable] {
            return [MenuItem1(), MenuItem2(), MenuItem3()]
        }
    }
    
    
    fileprivate struct MenuItem1: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Mood"))
        }
    }
    fileprivate struct MenuItem2: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Activity"))
        }
    }
    fileprivate struct MenuItem3: MenuItemViewCustomizable {
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: "Context"))
        }
    }
    
}

class RootViewControoler: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("program comes here.....")

        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 20
        pagingMenuController.view.frame.size.height -= 64
        pagingMenuController.onMove = { state in
            switch state {
            case let .willMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .didMoveController(menuController, previousMenuController):
                print(previousMenuController)
                print(menuController)
            case let .willMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case let .didMoveItem(menuItemView, previousMenuItemView):
                print(previousMenuItemView)
                print(menuItemView)
            case .didScrollStart:
                print("Scroll start")
            case .didScrollEnd:
                print("Scroll end")
            }
        }
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.extendedLayoutIncludesOpaqueBars = true
    }
}

