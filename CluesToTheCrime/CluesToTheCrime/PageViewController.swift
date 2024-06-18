//
//  PageViewController.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import UIKit

// Creating a subclass of UIPageViewController which manages the pages and handles the page curl animation
class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    // Array holding the view controllers for each page
    var pages = [UIViewController]()
    
    // Called after the view controller has loaded its view hierarchy into memory, setting the initial page
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the data source and delegate to self
        self.dataSource = self
        self.delegate = self
        
        // Create static content pages
        let page1 = UIViewController()
        page1.view.backgroundColor = .red
        
        let page2 = UIViewController()
        page2.view.backgroundColor = .green
        
        let page3 = UIViewController()
        page3.view.backgroundColor = .blue
        
        // Add the pages to the array
        pages = [page1, page2, page3]
        
        // Set the initial page to be displayed
        let initialPage = 0
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
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
        
        // Calculating the previous index
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pages.count > previousIndex else { return nil }
        
        return pages[previousIndex]
    }
    
    // Return the view controller to display after the given view controller
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else {
            return nil
        }
        
        // Calculating the next index
        let nextIndex = viewControllerIndex + 1
        guard pages.count != nextIndex else { return nil }
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
}
