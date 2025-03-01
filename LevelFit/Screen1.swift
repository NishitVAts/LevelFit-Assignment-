//
//  Screen1.swift
//  LevelFit
//
//  Created by Nishit Vats on 26/02/25.
//

import SwiftUI

struct Screen1: View {
    @StateObject var viewModel = Screen1VM()
    @State var showMore:Bool = false
    var body: some View {
        ZStack{
            Color.B_1.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            ScrollView{
                Image("HeroImage").resizable()
                    .scaledToFit()
                HStack{
                    Text("Get Started").font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Spacer()
                }.padding(.horizontal)
                    .padding(.bottom,30)
                
                FirstCard()
                HStack{
                    Text("Explore").font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top,30)
                    .padding(.bottom)
               menuView
                HStack{
                    Text("Recommended For you").font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top,30)
                    .padding(.bottom)
                
                ScrollView(.horizontal) {
                    LazyHStack{
                        ForEach(0..<5){_ in
                                HomeCardView()
                        }
                    }
                }
                
                HStack{
                    Text("Recents").font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Spacer()
                }.padding()
                    
                
                ScrollView(.horizontal) {
                    LazyHStack{
                        ForEach(0..<5){_ in
                                HomeCardView()
                        }
                    }
                }
                
                HStack{
                    Text("Learn").font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Spacer()
                }.padding()
                
                LearCard()
                
                
                HStack{
                    Text("Featured").font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    Spacer()
                }.padding()
                
                ScrollView(.horizontal) {
                    LazyHStack{
                        ForEach(viewModel.FeaturedCard){card in
                            FeaturedCard(card: card).padding()
                        }
                    }
                }
               
               FooterView()
               
                
                
            }.edgesIgnoringSafeArea(.top)
        }
    }
    
}

struct FooterView:View {
    var body: some View {
        HStack{
            VStack(alignment:.leading){
                Color.B_1.frame(height: 80)
            Text("Made Mindfully in 🇮🇳")
                Text("Clear Mind \nBetter Performance").fontWeight(.heavy).font(.system(size: 35))
                    
            }.foregroundColor(.white).opacity(0.4)
            Spacer()
        }.padding()
    }
}

extension Screen1 {
    var menuView: some View {
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 80, maximum: 100)),
            GridItem(.adaptive(minimum: 80, maximum: 100)),
            GridItem(.adaptive(minimum: 80, maximum: 100)),
            GridItem(.adaptive(minimum: 80, maximum: 100))
        ], spacing: 16) {
            ForEach(viewModel.MenuData) { data in
                MenuOptionCard(option: data)
            }
        }
        .padding(.horizontal)
    }
}


struct FeaturedCard:View {
    var card:FeaturedCardModel
    var time = "10 Mins"
    var body: some View {
        ZStack{
            Image(card.backGround).resizable().scaledToFit()
            LinearGradient(colors: [.B_1.opacity(0.5),.B_3.opacity(0.5)], startPoint: .top, endPoint: .bottom)
            VStack(){
                HStack{
                    Text(card.tag).foregroundStyle(.midnight)
                    Spacer()
                }
                HStack{
                    Text(card.title).font(.title2).foregroundStyle(.white).bold()
                    Spacer()
                }
                Spacer()
                
                HStack{
                    Text(card.author).foregroundStyle(.white).bold()
                    Spacer()
                }.padding(.bottom)
                HStack{
                    Text(card.context).foregroundStyle(.white).bold()
                        .multilineTextAlignment(.leading).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
                HStack{
                    Text("10 mins").foregroundStyle(.white).bold()
                        .padding(.horizontal,30).padding(.vertical,10).background(.ultraThinMaterial)
                        .clipShape(Capsule())
                    Spacer()
                    Image(systemName:"play.fill").padding().background(.white).clipShape(Circle())
                }.padding(.trailing)
                
               
            }.padding()
            .shadow(radius: 10)
        }.frame(width: 370).cornerRadius(20)
        
    }
}

struct LearCard:View {
    var image:Image = Image("YogaPic")
    var title:String = "How to meditate like a monk"
    var body: some View {
        HStack{
            image.resizable().scaledToFit().frame(width: 111)
            VStack(alignment:.leading){
                Text(title).bold()
                Text("Read More").font(.system(size: 12))
            }.padding(.horizontal)
            
            Image("Share").resizable().scaledToFit().frame(width: 10).padding().background(.B_1).clipShape(Circle())
        }.foregroundColor(.white)
            .padding()
            .background(.B_3)
            .cornerRadius(20)
            .padding(.vertical)
    }
}

struct HomeCardView:View{
    var image:Image = Image("CardImage1")
    var title:String = "Freedom Series"
    var author:String = "Akhil Aryan"
    var tag:String = "Meditation Series"
    var body : some View{
        VStack(alignment:.leading){
            image.resizable().scaledToFit().frame(width:160,height: 160)
            Text(tag).font(.system(size: 14)).foregroundStyle(.mint1)
            Text(title).bold()
            Text(author).font(.system(size: 14))
        }.padding(.horizontal,10).padding(.vertical)
            .foregroundColor(.white)
    }
}

struct MenuOptionCard:View {
    var option:MenuOptionModel
    var body: some View {
        RoundedRectangle(cornerRadius: 20).fill(.B_3).frame(height: 88)
            .overlay{
                VStack{
                    Image("\(option.icon)").resizable().scaledToFit().frame(width: 30)
                    Text(option.title).font(.system(size: 12)).foregroundStyle(.white)
                }.padding()
               
            }
    }
}

struct FirstCard:View{
    var topLine:String = "Meditation Series"
    var titleText:String = "Manage your emotions"
    var image:Image = Image("Meditation")
    var hostName:String = "Ranveer Allahabadia"
    var body: some View{
        HStack(){
            VStack(alignment:.leading,spacing: 10){
                Text(topLine).font(.system(size: 12)).foregroundStyle(.midnight)
                    
                Text(titleText).font(.title3)
                HStack{
                    Image("3Menu").resizable().scaledToFit().frame(width: 15)
                    Text("9").font(.system(size: 10))
                }
                
                Text(hostName).font(.system(size: 12))
                
            }.padding(.vertical)
                .padding(.leading)
            Spacer()
            VStack{
                Spacer()
                image.resizable().scaledToFit().frame(width: 160)
                Spacer()
            }.padding(.trailing)
        }.foregroundColor(.white)
            .padding(5)
            .background(.B_3)
            .cornerRadius(20)
            .padding(.horizontal)
    }
}

#Preview {
    Screen1()
}
