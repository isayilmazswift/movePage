//
//  DropViewDelegate.swift
//  DragGestures
//
//  Created by İsa Yılmaz on 24.03.2021.
//

import SwiftUI

struct DropViewDelegate: DropDelegate {
    
    var page : Page
    var pageData : PageViewModel

    func performDrop(info: DropInfo) -> Bool {
        pageData.currentPage = nil
        
        return true
    }
    
    func dropEntered(info: DropInfo) {
        
        if pageData.currentPage == nil {
            pageData.currentPage = page
        }
        
        //from index
        let fromIndex = pageData.urls.firstIndex{ (page) -> Bool in
            return page.id == pageData.currentPage?.id
            
        } ?? 0
        
        //to index
        let toIndex = pageData.urls.firstIndex{ (page) -> Bool in
            return page.id == self.page.id
            
        } ?? 0
        
        if fromIndex != toIndex {
            // swapping data..
            
            withAnimation{
                let fromPage = pageData.urls[fromIndex]
                pageData.urls[fromIndex] = pageData.urls[toIndex]
                pageData.urls[toIndex] = fromPage
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
}

