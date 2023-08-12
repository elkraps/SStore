//
//  FirstScreen.swift
//  SStore
//
//  Created by Vlad Dzirko on 11.08.2023.
//

import SwiftUI

struct FirstScreen: View {
    var body: some View {
        NavigationView {
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading) {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(0 ..< 7) { item in
                                CircleHorizontalMenu(image: Image("logo"))
                            }
                        }
                        .padding([.horizontal, .vertical])
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0 ..< 7) { item in
                                SaleView(image: Image("sale"))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    QrView()
//                        .padding(.vertical)
                        .padding([.horizontal, .vertical])
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0 ..< 7) { item in
                                PersonalView(image: Image("coffee"))
                            }
                        }
                        .padding(.horizontal)
                        
                    }
                    
                    Text("Рекомендуем")
                        .font(.system(size: 25, weight: .bold))
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0 ..< 5) { item in
                                GoodsView(image: Image("coca"), text: "99.90")
                                
                            }
                        }
                        .padding([.horizontal, .vertical])
                    }
                    
                    Text("Cладкое настроение")
                        .font(.system(size: 25, weight: .bold))
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0 ..< 5) { item in
                                GoodsView(image: Image("icecream"), text: "250.70")
                                
                            }
                        }
                        .padding([.horizontal, .vertical])
                    }
                    
                }
                
                
            }
            
            .toolbar {

                ToolbarItem(placement: .navigationBarLeading) {
                    LocationMenu()
                        
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(.green)
                        
                    }
                    .padding(.bottom, 5)
                }
            }
        }
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}

struct LocationMenu: View {
    var body: some View {
        HStack {
            
            HStack {
                Image("location")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 10)

                
                Text("Москва, Москва и Московская область")
                    .font(.system(size: 15))
                    .padding(.vertical, 8)
                    .padding(.trailing, 10)

                    
            }
            .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(.gray, lineWidth: 1)
                .opacity(0.6)
            )
 
        }
        .padding(.bottom, 5)
    }
}

struct CircleHorizontalMenu: View {
    let image: Image
    
    var body: some View {
        VStack(spacing: 8) {
            image
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .overlay(RoundedRectangle(cornerRadius: 50)
                    .stroke(.green, lineWidth: 4))
                
            
            Text("Привилегии \n«Мой SPAR»")
                .font(.system(size: 15, weight: .light))
        }
    }
}

struct SaleView: View {
    let image: Image
    
    var body: some View {
        VStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 190)
                .cornerRadius(25)
        }
    }
}

struct ImageOverlay: View {
    
    
    var body: some View {
        HStack(spacing: 10) {
            
            Text("0 бонусов")
                .font(.system(size: 30, weight: .bold))
                
            
            Spacer()
            
            Image("qr")
                .resizable()
                .scaledToFill()
                .frame(width: 125, height: 125)
                .cornerRadius(15)
        }
        .padding(.horizontal, 35)
    }
}

struct QrView: View {
    var body: some View {
        HStack {
            Image("back")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 160)
                .cornerRadius(25)
                .overlay(ImageOverlay(), alignment: .leading)
        }
    }
}

struct PersonalView: View {
    let image: Image
    
    var body: some View {
        VStack {
            image
                .resizable()
                .frame(width: 140, height: 170)
                .cornerRadius(20)
                
                .overlay(alignment: .topLeading) {
                    Text("Абонемент \nна кофе")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .medium))
                        .padding()
                }
        }
    }
}

struct GoodsView: View {
    let image: Image
    let text: String
    
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: 180, height: 170)
                .padding()
            
            HStack(spacing: 2) {
                Text("\(text) ₽/шт")
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Image(systemName: "basket.fill")
                        .padding(14)
                        .foregroundColor(.white)
                        .background(Color.green)
                    
                        .cornerRadius(50)
                    
                }
            }
            .padding()
        }
        .frame(width: 180)
        .background(.white)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
