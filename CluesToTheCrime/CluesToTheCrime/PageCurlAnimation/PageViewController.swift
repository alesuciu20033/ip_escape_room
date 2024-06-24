//
//  PageViewController.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import UIKit

// Creating a subclass of UIPageViewController which manages the pages and handles the page curl animation
class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var pages = [UIViewController]()
    
// Called after the view controller has loaded its view hierarchy into memory, setting the initial page
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
// Set the initial page to be displayed
        if !pages.isEmpty {
            setViewControllers([pages[0]], direction: .forward, animated: true, completion: nil)
        }
    }
    
    // Return the total number of pages
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    // Return the index of the currently displayed page
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    // Creating the page navigation
    // Return the view controller to display before the given view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard pages.count != nextIndex else { return nil }
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
}
