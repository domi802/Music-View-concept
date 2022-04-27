//
//  ContentView.swift
//  MusicApp
//
//  Created by Dominik Woźniak on 24/04/2022.
//

import SwiftUI



struct MusicPlayerBar: View{
    
    let namespace: Namespace.ID
    
    var body: some View{
        
        HStack{
            Image("cover")
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(4)
                .padding()
                .matchedGeometryEffect(id: "animation", in: namespace)
            Text("Enemy")
                .font(.headline)
            
            
            Spacer()
            
            Image(systemName: "play.fill")
            Image(systemName: "forward.fill")
                .padding(.trailing, 10)
            
        }.frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.881))
    }
}


struct MusicPlayer: View{
    
    let namespace: Namespace.ID
    
    var body: some View{
        VStack{
            Image("cover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(40)
                .matchedGeometryEffect(id: "animation", in: namespace)
            Spacer()
            
            HStack{
                VStack(alignment: .leading){
                    Text("Enemy")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Imagine Dragons")
                        .font(.title)
                        .fontWeight(.light)
                        .opacity(0.5)
                        .foregroundColor(.white)
                }.padding()
                Spacer()
            }
            
            HStack{
                Image(systemName: "backward.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .padding([.leading, .trailing],75)
                
                Image(systemName: "forward.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                
            }
            
            Spacer()
            
        }.frame(maxWidth:.infinity, maxHeight:  .infinity)
            .background(.black)
        
    }
}
struct ContentView: View {
    @Namespace private var ns
    @State private var showDetails: Bool = false
    
    var body: some View {
        VStack{
        Spacer()
            if showDetails{
                MusicPlayer(namespace: ns)
            }else {
                MusicPlayerBar(namespace: ns)
            }
    
        }.onTapGesture {
            withAnimation(.spring()){
            showDetails.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
