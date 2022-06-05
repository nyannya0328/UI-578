//
//  RecponceView.swift
//  UI-578
//
//  Created by nyannyan0328 on 2022/06/05.
//

import SwiftUI

struct RecponceView<Content : View>: View {
    var content : (Properties) -> Content
    var body: some View {
        GeometryReader{proxy in
            
             let size = proxy.size
            
            let isRandScape = (size.width > size.height)
            let isIpad = UIDevice.current.userInterfaceIdiom == .pad
            
            
            content(Properties(isRandScape: isRandScape, isIpad: isIpad, isSprit: isSprit(), size: size))
                .frame(width: size.width, height: size.height)
                .onAppear {
                    
                    
                    updateNotification(faction: isRandScape && isSprit() ? 0.3 : 0.5)
                    
                }
                .onChange(of: isRandScape) { newValue in
                    
                    updateNotification(faction: newValue && isSprit() ? 0.3 : 0.5)
                }
        }
        
    }
    
    func updateNotification(faction : Double){
        
        NotificationCenter.default.post(name: NSNotification.Name("UPDATENOTIFICATION"), object: nil,userInfo: [
        
        
            "Fraction" : faction
        
        ])
        
    }
    func isSprit()->Bool{
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            
            return false
        }
        return screen.windows.first?.frame.size != screen.windows.first?.frame.size
    }
}



struct Properties{
    
    var isRandScape : Bool
    var isIpad : Bool
    var isSprit : Bool
    var size : CGSize
    
    
}
