//
//  Screen1VM.swift
//  LevelFit
//
//  Created by Nishit Vats on 26/02/25.
//

import Foundation

class Screen1VM:ObservableObject{
    @Published var MenuData :[MenuOptionModel] = [
        .init(icon: "Image 1", title: "Meditation"),
        .init(icon: "Image 2", title: "Workout"),
        .init(icon: "Image 3", title: "Sleep"),
        .init(icon: "Image 4", title: "More"),
        .init(icon: "Image 5", title: "Mantras"),
        .init(icon: "Image 6", title: "Events"),
        .init(icon: "Image 7", title: "Courses"),
        .init(icon: "Image 8", title: "Community"),
        .init(icon: "Image 9", title: "Timer"),
        .init(icon: "Image 10", title: "Affirmation"),
        .init(icon: "Image 11", title: "Music"),
        .init(icon: "Image 12", title: "Journal"),
    ]
    
    @Published var FeaturedCard:[FeaturedCardModel] = [
        .init(tag: "Meditation Series", title: "Change your thought patterns", backGround: "LearnCard 1", author: "Ranveer Allahbadia", context: "Break down your thought patterns and understand why you think the way you do to optimise your emotional well-being."),
        
        .init(tag: "Meditation Series", title: "Change your personality", backGround: "LearnCard 2", author: "Samay Raina", context: "Break down your thought patterns and understand why you think the way you do to optimise your emotional well-being."),
        
        .init(tag: "Chill Series", title: "Change your body", backGround: "LearnCard 3", author: "Apporva Arora", context: "Break down your thought patterns and understand why you think the way you do to optimise your emotional well-being.")
    ]
    
}
