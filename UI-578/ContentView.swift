//
//  ContentView.swift
//  UI-578
//
//  Created by nyannyan0328 on 2022/06/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       MainView()
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
