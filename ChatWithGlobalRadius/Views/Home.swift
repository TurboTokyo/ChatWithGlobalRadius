//
//  Home.swift
//  ChatWithGlobalRadius
//
//  Created by ALEXANDR DRAGUNOV on 11/4/20.
//

import SwiftUI

struct Home: View {
    @StateObject var homeData = HomeModel()
    @AppStorage("current_user") var user = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { reader in
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(homeData.msgs) { msg in
                            ChatRow(chatData: msg)
                        }
                    }
                }
            }
            
            HStack(spacing: 15) {
                TextField("Enter massage", text: $homeData.txt)
                    .padding(.horizontal)
                    .frame(height: 45)
                    .background(Color.primary.opacity(0.06))
                    .clipShape(Capsule())
                
                if homeData.txt != "" {
                    Button(action: {}, label: {
                        Image(systemName: "paperplane.fill")
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .frame(width: 45, height: 45)
                            .background(Color.blue)
                            .clipShape(Circle())
                    })
                }
            }
            .animation(.default)
            .padding()
        }
            .onAppear(perform: {
                homeData.onAppear()
            })
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
