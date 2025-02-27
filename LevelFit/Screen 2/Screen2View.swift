//
//  Screen2View.swift
//  LevelFit
//
//  Created by Nishit Vats on 27/02/25.
//

import SwiftUI
import Charts

enum selectedTabs:String{
    case myLibrary = "My Library"
    case insights = "Insights"
}

struct Screen2View: View {
    @State var optionSelected:selectedTabs = .myLibrary
    var body: some View {
        ZStack{
            Color.B_1.edgesIgnoringSafeArea(.all)
            VStack{
                ScrollView{
                    profile.padding()
                    HStack{
                        buttons()
                        buttons(icon: Image("Award"),number: "#04",caption: "Gold League")
                    }
                    
                    HStack{
                        
                        VStack{
                            Text("My Library")
                            Rectangle().frame(height: (optionSelected == .myLibrary ? 1 : 0))
                        }
                        .onTapGesture {
                            withAnimation {
                                optionSelected = .myLibrary
                            }
                        }
                       
                        VStack{
                            Text("Insights")
                            Rectangle().frame(height: (optionSelected == .insights ? 1 : 0))
                        }.onTapGesture {
                            withAnimation {
                                optionSelected = .insights
                            }
                           
                        }
                        
                    }.foregroundColor(.white)
                        .padding(.vertical)
                        .padding(.top,30)
                    
                    if optionSelected == .myLibrary{
                        MyLibrary()
                        ForEach(0..<4){_ in
                            SettingTabs()
                        }
                    }else {
                        Group{
                            progressCard.padding(.top)
                            
                            WeeklyChart()
                            
                            DailyChart()
                        }
                    }
                    
                    
                    HStack{
                        VStack(alignment:.leading){
                            Color.B_1.frame(height:80)
                            Text("Made Mindfully in 🇮🇳")
                            Text("Clear Mind \nBetter Performance").fontWeight(.heavy).font(.system(size: 35))
                                
                        }.foregroundColor(.white).opacity(0.4)
                        Spacer()
                    }.padding()
                    
                }.scrollIndicators(.hidden)
            }
        }
    }
    
    private var progressCard: some View{
        HStack{
            Text("30%").font(.title)
                .padding(.leading)
            Rectangle().frame(width: 2)
                .padding(.horizontal,10)
            Text("Your mindfullness practice increases by 30% this week")
                .padding(.trailing)
        }.foregroundColor(.white)
            .padding()
            .background{
                RoundedRectangle(cornerRadius: 20)
                    .fill(LinearGradient(colors: [.green,.black], startPoint: .leading, endPoint: .trailing))
            }
    }
    
    private var profile: some View{
        HStack{
            Text("S")
                .foregroundColor(.white)
                .font(.system(size: 40)).padding()
                .background(Color(red: 0.0, green: 0.3176470588235294, blue: 0.28627450980392155)).clipShape(Circle())
                
            VStack(alignment:.leading){
                HStack{
                    Text("Sourav").font(.system(size: 20))
                    Image("crown").resizable().scaledToFit().frame(width: 20)
                }
                
                Text("Level Premium User \(Image(systemName:"chevron.right"))").font(.system(size: 12)).foregroundStyle(.yellowL)
            }.padding()
            Spacer()
            Image("Settings").resizable().scaledToFit()
                .frame(width: 30)
            
            
        }.foregroundStyle(.white)
    }
   
}

struct buttons:View {
    var icon:Image = Image("emote")
    var number:String = "17"
    var caption:String  = "Days Streak"
    var body: some View {
        HStack{
            icon.resizable().scaledToFit().frame(width: 30)
            VStack(alignment:.leading){
                Text(number).bold()
                Text(caption).opacity(0.5)
            }.font(.system(size: 16))
        }.foregroundColor(.white)
            .padding(.horizontal,30)
            .padding(.vertical,10)
            .overlay{
                RoundedRectangle(cornerRadius: 15).stroke().foregroundColor(.white)
                    .opacity(0.5)
            }
    }
}

struct DailyChart: View {
    @StateObject var viewModel = Screen2VM()

    var body: some View {
        VStack(alignment:.leading) {
            Text("Mindful days this week")
                .font(.title3)
                .bold()
                .padding(.vertical)
            
            Text("This Week you were mindful for 7 days! To prevent breaking your streak, try using streak freeze")
                .font(.system(size: 12))
                .padding(.trailing, 50)
            
            Chart {
                
                ForEach(viewModel.dailyData, id: \.Date) { item in
                    BarMark(
                        x: .value("Day", item.Date.dayOfWeek()),
                        y: .value("XP", item.xp)
                    )
                    .foregroundStyle(LinearGradient(colors: [.mint, .midnight], startPoint: .bottom, endPoint: .top))
                    .cornerRadius(20)
                    .annotation(position: .top) {
                        Text("\(item.xp)")
                            .font(.caption)
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                }
                
                // Average XP Line
                RuleMark(y: .value("Average XP", viewModel.averageXP))
                    .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                    .foregroundStyle(.white)
                    
            }
            .frame(height: 300)
            .padding()
//            .chartXAxis {
//                AxisMarks { value in
//                    if let day = value.as(String.self) {
//                        AxisValueLabel {
//                            Text(day)
//
//                                .bold() // Make it bold
//                                .foregroundColor(.white) // Change color
//                        }
//                    }
//                }
//            }
        }
        .foregroundStyle(.white)
        .padding()
        .background(.B_3)
        .cornerRadius(20)
        .padding()
    }
}

struct WeeklyChart: View {
    @StateObject var viewModel = Screen2VM()
    var body: some View {
        VStack(alignment:.leading) {
            Text("Weekly XP Comparison")
                .font(.title3)
                .bold()
                .padding(.vertical)
            
            Text("This Week your average number of activities dropped by 30% from last week. To boost your consistency, commit to streaks after an activity.")
                .font(.system(size: 12))
                .padding(.trailing, 50)
            
            Chart(viewModel.groupedWeeklyData, id: \.weekNumber) { item in
                BarMark(
                    x: .value("Week", "Week \(item.weekNumber)"),
                    y: .value("XP", item.totalXP)
                )
                .foregroundStyle(LinearGradient(colors: [.mint, .midnight], startPoint: .bottom, endPoint: .top))
                .cornerRadius(10)
                .annotation(position: .overlay) {
                    Text("\(item.totalXP)\n XP")
                        .font(.headline)
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .frame(height: 300)
            .padding()
        }
        .foregroundStyle(.white)
        .padding()
        .background(.B_3)
        .cornerRadius(20)
        .padding()
    }
}


struct MyLibrary:View {
    var body: some View {
        VStack{
            HStack{
                Text("Recent Played").font(.title2)
                    .fontWeight(.semibold)
                    
                Spacer()
                Text("See all").opacity(0.5)
                
            }.padding().foregroundStyle(.white)
            
            ScrollView(.horizontal) {
                LazyHStack{
                    ForEach(0..<5){_ in
                            HomeCardView()
                    }
                }
              
            }
        }
    }
}

struct SettingTabs:View {
    var icon:Image = Image(systemName:"heart")
    var text:String = "My Favourites"
    var body: some View {
        HStack{
            icon
            Text(text)
            Spacer()
            Image(systemName:"chevron.right")
        }.foregroundColor(.white)
            .padding()
    }
}



#Preview {
    Screen2View()
}
