//
//  PageViewControllerWrapper.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI

// A new struct conforming to the UIViewControllerRepresentable protocol, allowing the integration of a UIViewController into the view hierarchy.
struct PageViewControllerWrapper: UIViewControllerRepresentable {
    var pages: [UIViewController]
    
    // This method creates and returns an instance of the UIPageViewController
    func makeUIViewController(context: Context) -> UIPageViewController {
        // Initializing the custom PageViewController with page curl transition style and horizontal navigation orientation
        let pageViewController = PageViewController(transitionStyle: .pageCurl, navigationOrientation: .horizontal, options: nil)
        pageViewController.pages = pages
        return pageViewController
    }

    // Updating the UIPageViewController when the view's state changes
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {}
}
