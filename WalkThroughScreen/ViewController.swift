//
//  ViewController.swift
//  WalkThroughScreen
//
//  Created by   admin on 04.10.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //ScrollView with PageControl
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
    
    //content for ScrollView
    let labels = ["First Text", "Second Text", "Third Text"]
    var pageViews: [PageView]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        configureScrollView()
            
    }
    

    //MARK: Add ScrollView with PageControl
    private func addViews() {
        
        view.addSubview(scrollView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        //configure PageControl and add to main view
        pageControl.numberOfPages = labels.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .cyan
        pageControl.pageIndicatorTintColor = .gray
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
    }
    
    
    //MARK: Configure ScrollView
    private func configureScrollView() {
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        //define how long it will be
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(labels.count), height: view.frame.height)
        
        
        //populate our ScrollView with views
        for (index, label) in labels.enumerated() {
            let pageView = PageView()
            pageView.textLabel.text = label
            pageView.frame.size = CGSize(width: view.frame.width/2, height: view.frame.height/2)
            pageView.center = CGPoint(x:view.frame.width * CGFloat(index) + view.center.x, y: view.center.y)
            
            //collect array of pages for later use with scrolling
            pageViews.append(pageView)
            scrollView.addSubview(pageView)
            
        }
    }
    
    
}

//MARK: Delegate
extension ViewController: UIScrollViewDelegate {
    
    // while you drag the view, the contentOffset changes in range 0 to contentSize
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        let fullWidth = view.frame.width
        
        //use index to understand what page to scale
        let index = Int(offset.x/fullWidth)
        
        //here we calculate % between offset and view width
        let scale = 1 - (offset.x - CGFloat(index) * fullWidth) / fullWidth
        print((index))
       
        //let's scale while dragging
        pageViews[Int(index)].transform = CGAffineTransform(scaleX: scale, y: scale)
        
        
    }
    
    // PageControl swither is here
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        pageControl.currentPage = Int(offset.x/view.frame.width)
    }
    
}
