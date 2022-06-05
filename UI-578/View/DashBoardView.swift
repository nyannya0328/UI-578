//
//  DashBoardView.swift
//  UI-578
//
//  Created by nyannyan0328 on 2022/06/05.
//

import SwiftUI

struct DashBoardView: View {
    var props : Properties
    @Binding var showSlideBar : Bool
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            let showDetails = props.isIpad && !props.isSprit && props.isRandScape
            
            VStack(spacing:12){
                
                TopNavBar()
                
             
                
                
                VStack(spacing:15){
                    
                    HStack{
                        
                        
                        Text("My Files")
                            .fontWeight(.medium)
                        
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            
                            Label {
                                
                                Text("Add Now")
                                
                                
                                
                            } icon: {
                                
                                Image(systemName: "plus")
                            }
                            .foregroundColor(.white)
                            .padding(.vertical,13)
                            .padding(.horizontal)
                             .background{
                            
                                 RoundedRectangle(cornerRadius: 10, style: .continuous)
                                     .fill(Color("Blue"))
                            }

                        }

                    }
                    .padding(.vertical)
                   
                    
                    OnlineStorageView()
                    
        
                    
                    FileView()
                        .padding(.top)
                    
                    
                    if !showDetails{
                        
                        StorageView()
                    }
                    
                    
                
                }
                .padding(.trailing,showDetails ? (props.size.width / 4) + 15 : 0)
                .overlay(alignment: .topTrailing) {
                    
                    
                    if showDetails{
                        
                        
                        StorageView()
                            .frame(width: props.size.width / 4)
                        
                        
                    }
                }
                
                
            }
            .padding()
            
        }
        .frame(maxWidth: .infinity,alignment: .center)
        .background{
         
            
            Color("BG").ignoresSafeArea()
        }
    }
    
    func getIndex(item : StorageDetail)->Int{
        
        return sampleStorageDetails.firstIndex { Ctem in
            
            Ctem.id == item.id
        } ?? 0
        
    }
    
    func getAngle(item : StorageDetail)->Angle{
        
        let index = getIndex(item: item)
        
        let prefixItem = sampleStorageDetails.prefix(index)
        
        var angele : Angle = .zero
        
        for item in prefixItem{
            
            
            angele += .init(degrees: item.progress * 360)
            
            
        }
        
        return angele
        
    }
    
    @ViewBuilder
    func StorageView()->some View{
        
        
        VStack(alignment: .leading, spacing: 13) {
            
            Text("Storage Details")
                .font(.title3.bold())
                .padding(.bottom,10)
            
            ZStack{
                
                Circle()
                    .stroke(Color("BG"),lineWidth: 25)
                
                
                ForEach(sampleStorageDetails){storage in
                    
                    
                    let index = CGFloat(getIndex(item: storage))
                    
                    let progress = index / CGFloat(sampleFiles.count)
                    
                    
                    Circle()
                        .trim(from: 0, to: storage.progress)
                        .stroke(storage.progressColor,lineWidth: 35 - (10 * progress))
                        .rotationEffect(.init(degrees: -90))
                        .rotationEffect(getAngle(item: storage))
                }
                
                
                VStack{
                    
                    Text("30.0")
                        .font(.largeTitle.bold())
                    
                    Text("Of 128GB")
                        .font(.callout.weight(.semibold))
                }
                
            }
            .frame(height: 220)
            .padding()
            .padding(.top)
            
            
            ForEach(sampleStorageDetails){item in
                
                HStack(spacing:15){
                    
                    
                 
                    Image(item.icon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text(item.type)
                            .font(.callout.bold())
                            .foregroundColor(.white.opacity(0.6))
                        
                        
                        Text(item.files + "Filees")
                            .font(.caption2.weight(.light))
                        
                        
                    }
                      .frame(maxWidth: .infinity,alignment: .leading)
                    
                    
                    
                    Text(item.size)
                        .font(.callout.bold())
                        .foregroundColor(.white.opacity(0.8))
                }
                .padding()
                .background{
                 
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(.white.opacity(0.2))
                }
                
                
            }
            
            
            
            
            
        }
          .frame(maxWidth: .infinity,alignment: .leading)
          .padding()
          .background{
           
              RoundedRectangle(cornerRadius: 8, style: .continuous)
                  .fill(Color("Overlay"))
          }
          .padding(.top)
        
    }
    
    @ViewBuilder
    func FileView()->some View{
        
        VStack(alignment: .leading, spacing: 20) {
            
            
            Text("Recnet Files")
                .fontWeight(.semibold)
                .foregroundColor(.white.opacity(0.8))
            
            
            HStack(spacing:0){
                
                
                ForEach(["File Name","Date","Size"],id:\.self){type in
                    
                    
                    Text(type)
                        .italic().fontWeight(.medium)
                        .frame(maxWidth: .infinity,alignment: type == "File Name" ? .leading : .center)
                    
                    
                }
                
            }
            .foregroundColor(.white.opacity(0.5))
            
            
            Rectangle()
                .fill(.white.opacity(0.3))
                .frame(height: 3)
                .padding(.horizontal,-25)
            
            ForEach(sampleFiles){file in
                
                
                HStack(spacing:10){
                    
                    Image(file.fileIcon)
                        .resizable()
                         .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                    
                    
                    Text(file.fileType)
                          .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Text(file.fileDate)
                          .frame(maxWidth: .infinity,alignment: .center)
                    
                    Text(file.fileSize)
                          .frame(maxWidth: .infinity,alignment: .center)
                }
                .font(.system(size: props.isIpad ? 18 : 14, weight:.semibold))
                .foregroundColor(.white.opacity(0.8))
                
                
                Rectangle()
                    .fill(.white.opacity(0.3))
                    .frame(height: 3)
                    .padding(.horizontal,-25)
            }
            
          
            
            
            
            
            
        }
         .padding()
          .frame(maxWidth: .infinity,alignment: .leading)
          .background{
           
              
              RoundedRectangle(cornerRadius: 13, style: .continuous)
                  .fill(Color("Overlay"))
          }
        
        
    }
    
    @ViewBuilder
    func OnlineStorageView()->some View{
        
        
        let count = (props.isIpad && !props.isSprit ? 1 : 2)
        
        
        ScrollView(count == 1 ? .horizontal : .vertical, showsIndicators: false) {
            
            DyanamicStorageView(count: count) {
                
                ForEach(sampleStorages){storage in
                    
                    
                    VStack(alignment: .leading, spacing: 13) {
                        
                        HStack{
                            
                            Image(storage.icon)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 25, height: 25)
                                .padding(15)
                                .background{
                                 
                                    Circle()
                                        .fill(storage.progressColor.opacity(0.1))
                                }
                            
                            
                            Spacer(minLength: 5)
                            
                            Button {
                                
                            } label: {
                                
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white.opacity(0.5))
                                    .rotationEffect(.init(degrees: -90))
                            }
                            
                       
                        

                        }
                        
                        
                        Text(storage.title)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.8))
                        
                        
                        GeometryReader{proxy in
                            
                             let size = proxy.size
                            
                            ZStack(alignment:.leading){
                                
                                Capsule()
                                    .fill(.white.opacity(0.1))
                                
                                Capsule()
                                    .fill(storage.progressColor)
                                    .frame(width: storage.progress * size.width)
                            }
                        }
                        .frame(height: 5)
                        
                        
                        HStack{
                            
                            
                            Text("\(storage.fileCount) Files")
                                .font(.callout)
                                .foregroundColor(.gray)
                            
                            
                            Spacer(minLength: 5)
                            
                            
                            Text(storage.maxSize)
                                .font(.caption2.bold())
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                   // .frame(width: count == 2 ? nil : 150)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color("Overlay"))
                    }
                    
                    
                }
            }
    
            
        }
       
        
        
    }
    
    @ViewBuilder
    func DyanamicStorageView<Content : View>(count : Int,content : @escaping()->Content)->some View{
        
        let columns1 = Array(repeating: GridItem(.flexible(),spacing: 20), count: 1)
        
        let columns2 = Array(repeating: GridItem(.flexible(),spacing: 20), count: 2)
        
        
        if count == 1{
            
            LazyHGrid(rows: columns1,spacing: 15) {
                
                content()
            }
        }
        else{
            
            LazyVGrid(columns: columns2, spacing: 15) {
                
                content()
            }
        }
        
        
    }
    @ViewBuilder
    func TopNavBar()->some View{
        
        
        HStack{
           
            
            if props.isIpad && !props.isSprit{
                
                Text("DashBoard")
                    .font(.title3.bold())
                
                
            }
            else{
                
                
                Button {
                    withAnimation(.easeInOut(duration: 0.5)){
                        
                        showSlideBar = true
                    }
                } label: {
                    
                    
                    Image(systemName:"line.3.horizontal")
                        .font(.title2)
                        .foregroundColor(.white)
                }

                
                
            }
            
            
            HStack{
                
                TextField("Search", text: .constant(""))
                    .padding(.leading,20)
                    
                
                Button {
                    
                } label: {
                    
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .padding(8)
                        .background{
                         
                            
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(Color("Blue"))
                        }
                }
                

                
            }
            .background{
             
                RoundedRectangle(cornerRadius: 9, style: .continuous)
                    .fill(Color("Overlay"))
            }
            .frame(maxWidth: 250)
            .frame(maxWidth: .infinity,alignment: .trailing)
            
            
            Button {
                
            } label: {
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
            }


            
            
        }
        
        
    }
}

struct DashBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
