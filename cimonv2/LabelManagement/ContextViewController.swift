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
    private let viewController = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "testlabelcollectionvc") as! LabelCollectionViewController
    private let viewController1 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "testlabelcollectionvc") as! LabelCollectionViewController
    private let viewController2 = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "testlabelcollectionvc") as! LabelCollectionViewController
    
    
    
    internal var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate var pagingControllers: [UIViewController] {
        viewController.initData(labels: [LabelStruct(imageName: "task", labelText: "Angry"), LabelStruct(imageName: "", labelText: "Sad"), LabelStruct(imageName: "", labelText: "Happy"), LabelStruct(imageName: "", labelText: "Excited"), LabelStruct(imageName: "", labelText: "Annoyed"), LabelStruct(imageName: "", labelText: "Anxious")])
        viewController1.initData(labels: [LabelStruct(imageName: "sitting", labelText: "Sitting"),
                                          LabelStruct(imageName: "standing", labelText: "Standing"),
                                          LabelStruct(imageName: "walking", labelText: "Walking"),
                                          LabelStruct(imageName: "lying", labelText: "Lying"),
                                          LabelStruct(imageName: "running", labelText: "Running"),
                                          LabelStruct(imageName: "biking", labelText: "Biking"),
                                          LabelStruct(imageName: "stairsdown", labelText: "Stairs Down"),
                                          LabelStruct(imageName: "stairsup", labelText: "Stairs Up"),  LabelStruct(imageName: "", labelText: "Other")])
        viewController2.initData(labels: [LabelStruct(imageName: "", labelText: "Home"), LabelStruct(imageName: "", labelText: "Work"), LabelStruct(imageName: "", labelText: "School"), LabelStruct(imageName: "", labelText: "Store"), LabelStruct(imageName: "", labelText: "Commuting"), LabelStruct(imageName: "", labelText: "Restaurant")])
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

class ContextViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("program comes here.....")

        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        self.title = "Labelling"
        
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        //pagingMenuController.view.frame.origin.y += 80
        //pagingMenuController.view.frame.size.height -= 64
        
        pagingMenuController.view.frame.origin.y = self.view.bounds.origin.y

        
        /*
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
        }*/
        
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
        
        
        self.edgesForExtendedLayout = [.bottom]

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.tabBarController?.tabBar.isHidden = false
        //self.extendedLayoutIncludesOpaqueBars = true
        
        tabBarController?.tabBar.isHidden = true
        self.extendedLayoutIncludesOpaqueBars = false

    }
}

