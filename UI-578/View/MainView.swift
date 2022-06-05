//
//  MainView.swift
//  UI-578
//
//  Created by nyannyan0328 on 2022/06/05.
//

import SwiftUI

struct MainView: View {
    @State var currentTab : Tab = .dashboard
    
    @State var showSlider : Bool = false
    var body: some View {
        RecponceView { responce in
            
            HStack(spacing:0){
                
                if responce.isIpad && !responce.isSprit{
                    
                    
                    SlideView(currentTab: $currentTab, properties: responce)
                }
                
                DashBoardView(props: responce, showSlideBar: $showSlider)
                
                
                
              
                
            }
            .overlay {
                
                ZStack(alignment: .leading) {
                    
                    
                    Color.black
                        .opacity(showSlider ? 0.35 : 0)
                        .ignoresSafeArea()
                        .onTapGesture {
                            
                            withAnimation(.easeInOut(duration: 0.5)){
                                
                                showSlider = false
                            }
                          
                        }
                    
                    
                    if showSlider{
                        
                        SlideView(currentTab: $currentTab, properties: responce)
                            .transition(.move(edge: .leading))
                    }
                    
                }
                
                
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
