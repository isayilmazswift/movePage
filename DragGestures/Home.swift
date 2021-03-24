//
//  Home.swift
//  DragGestures
//
//  Created by İsa Yılmaz on 24.03.2021.
//

import SwiftUI

struct Home: View {
    
    @StateObject var pageData = PageViewModel()
    @Namespace var animation
    
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 45), count: 2)
        
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                
                //Custom Picker...
                
                HStack{
                    Image(systemName: "eyeglasses")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 80, height: 45, alignment: .center)
                        .foregroundColor(pageData.selectedTab == "private" ? .black : .white)
                        .background(
                            ZStack{
                                if pageData.selectedTab != "private" {
                                    Color.clear
                                }
                                else {
                                    Color.white
                                        .cornerRadius(10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                }
                            }
                        )
                        
                        .onTapGesture {
                            withAnimation{
                                self.pageData.selectedTab = "private"
                            }
                        }
                        
                    
                    Text("1")
                        .frame(width: 35, height: 35)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(pageData.selectedTab == "tabs" ? Color.black : Color.white, lineWidth: 3))
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 80, height: 45, alignment: .center)
                        .foregroundColor(pageData.selectedTab == "tabs" ? .black : .white)
                        .background(
                            ZStack{
                                if pageData.selectedTab != "tabs" {
                                    Color.clear
                                }
                                else {
                                    Color.white
                                        .cornerRadius(10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                }
                            }
                        )
                        
                        .onTapGesture {
                            withAnimation{
                                self.pageData.selectedTab = "tabs"
                            }
                        }
                    
                    Image(systemName: "laptopcomputer")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 80, height: 45, alignment: .center)
                        .foregroundColor(pageData.selectedTab == "device" ? .black : .white)
                        .background(
                            ZStack{
                                if pageData.selectedTab != "device" {
                                    Color.clear
                                }
                                else {
                                    Color.white
                                        .cornerRadius(10)
                                        .matchedGeometryEffect(id: "Tab", in: animation)
                                }
                            }
                        )
                        
                        .onTapGesture {
                            withAnimation{
                                self.pageData.selectedTab = "device"
                            }
                        }
                    
                    
                }
                .background(Color.white.opacity(0.15))
                .cornerRadius(15)
                .padding(.top)
                
                ScrollView{
                    //Tabs with page...
                    
                    LazyVGrid(columns: columns, spacing: 20, content: {
                    
                        ForEach(pageData.urls){ page in 
                            WebView(url: page.url)
                                .opacity(pageData.currentPage?.id == page.id ? 0.01 : 1)
                                .frame(height: 200)
                                .cornerRadius(15)
                                .padding(.horizontal)
                                .onDrag({
                                
                                    return NSItemProvider(contentsOf: URL(string: "\(page.id)")!)!
                                })
                                .onDrop(of: [.url], delegate: DropViewDelegate(page: page, pageData: pageData))
                        }
                        
                    })
                }
                
            }
            
        }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
