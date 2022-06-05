//
//  SlideView.swift
//  UI-578
//
//  Created by nyannyan0328 on 2022/06/05.
//

import SwiftUI

struct SlideView: View {
    @Binding var currentTab : Tab
    var properties : Properties
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:15){
                
                
                HStack{
                    
                    Image("icloud")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    
                    Text("iCloud")
                        .fontWeight(.bold)
                    
                }
                
                Rectangle()
                    .fill(.white.opacity(0.2))
                    .frame(height: 1)
                    .padding(.horizontal,-15)
                
              
                ForEach(Tab.allCases,id:\.rawValue){tab in
                    
                    Button {
                        withAnimation{currentTab = tab}
                    } label: {
                        
                        
                        HStack{
                            
                            Image(tab.rawValue)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                
                            
                            Text(tab.rawValue)
                                .font(.footnote.weight(.light))
                                
                        }
                        .foregroundColor(currentTab == tab ? .white : .gray.opacity(0.5))
                        .frame(maxWidth: .infinity,alignment: .leading)
                    }
                    .padding(.top)

                    
                }

                
            }
            .padding(15)
     
        }
        
        .frame(width: 220)
        .background{
         
            Color("Overlay").ignoresSafeArea()
        }
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
