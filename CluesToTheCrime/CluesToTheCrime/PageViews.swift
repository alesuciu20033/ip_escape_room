//
//  PageViews.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI
import CoreHaptics

struct CoverView: View {
    var body: some View {
        ZStack {
            Image("leather-texture")
                .resizable(capInsets: EdgeInsets(), resizingMode: .stretch)
                .edgesIgnoringSafeArea(.top)
            Text("Damon's Diary")
                .foregroundStyle(.white)
                .font(.system(size: 38, design: .serif))
                .bold()
                .padding(.bottom, 180)
        }
    }
}

struct PageOneView: View {
    var body: some View {
        ZStack {
            DiaryPageBackground()
            
            VStack {
                TextSection(date: "March 15, 2021", text: "I had a productive day at work today. Finished a major project that I’ve been working on for weeks. It feels great to see it finally completed. The team celebrated with a small party, and everyone was in high spirits.In the evening, I treated myself to a nice dinner at a new restaurant I've been wanting to try. The food was exquisite, and the ambiance was perfect for unwinding after a long day. I ended the night by watching my favorite show and reflecting on the achievements of the day.")
                TextSection(date: "April 2, 2021", text: "Went to the farmer's market this morning and bought some fresh fruits and vegetables. I spent the afternoon cooking a new recipe, and it turned out delicious!")
            }
            .padding(.horizontal, 30)
        }
    }
}


struct PageTwoView: View {
    var body: some View {
        ZStack {
            DiaryPageBackground()
            
            VStack(alignment: .leading) {
                TextSection(date: "May 10, 2021", text: "Met up with some friends I haven’t seen in a while. We had lunch at a new café downtown. It was so good to catch up and hear about what everyone’s been up to. We laughed a lot and made plans to meet again soon.")
                TextSection(date: "May 12, 2021", text: "Today, we wandered around the city, exploring new shops and taking in the sights. We even stumbled upon a street performance and watched for a while. It was a day filled with joy and connection, and I felt grateful for the friendships that have stood the test of time.")
            }
            .padding(.horizontal, 30)
        }
    }
}


struct PageThreeView: View {
    var body: some View {
        ZStack {
            DiaryPageBackground()
            
            VStack {
                TextSection(date: "June 8, 2021", text: "Spent the day at the beach. The weather was perfect, not too hot and with a gentle breeze. I swam in the ocean, built sandcastles with the kids, and had a picnic by the shore. It was a day well spent.")
                TextSection(date: "July 19, 2021", text: "Had a quiet day at home today. I did some gardening in the morning, planting new flowers and tidying up the yard. It was so satisfying to see the garden looking vibrant and healthy. I then spent the afternoon painting. It's so relaxing to just lose myself in my hobbies.")
            }
            .padding(.horizontal, 30)
        }
    }
}


struct PageFourView: View {
    var body: some View {
        ZStack {
            DiaryPageBackground()
            
            VStack {
                TextSection(date: "August 12, 2021", text: "Went hiking in the mountains today. The trail was challenging, but the views from the top were worth it. I felt a great sense of accomplishment reaching the peak and enjoyed the peaceful surroundings. The air was crisp and fresh, and the scenery was breathtaking.")
                TextSection(date: "September 30, 2021", text: "Visited the local art museum today. They have a new exhibit that I've been wanting to see. The artwork was stunning, and I felt inspired to create something of my own. I spent hours wandering through the galleries, absorbing the creativity and talent on display.")
            }
            .padding(.horizontal, 30)
        }
    }
}


// The page which contains the note
struct PageFiveNoteView: View {
    @Binding var showFallingNote: Bool
    @Binding var noteVisible: Bool
    @Binding var stage: Int
    @Binding var hideDiary: Bool
    @StateObject private var hapticFeedbackManager = HapticFeedbackManager()

    var body: some View {
        ZStack {
            if !hideDiary {
                DiaryPageBackground()

                VStack(spacing: 80) {
                    Image("scribble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Image("scribble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.8)
                    
                    Image("scribble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.7)
                    
                    Image("scribble")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(0.8)
                }
                .padding(.horizontal, 40)
                .onAppear {
                    hapticFeedbackManager.playHapticFeedback()
                    withAnimation {
                        showFallingNote = true
                        noteVisible = true
                    }
                }
            }
        }
    }
}

struct PageSixView: View {
    var body: some View {
        ZStack {
            DiaryPageBackground()
            
            VStack {
                TextSection(date: "August 12, 2021", text: "Went hiking in the mountains today. The trail was challenging, but the views from the top were worth it. I felt a great sense of accomplishment reaching the peak and enjoyed the peaceful surroundings. The air was crisp and fresh, and the scenery was breathtaking.")
                TextSection(date: "September 30, 2021", text: "Visited the local art museum today. They have a new exhibit that I've been wanting to see. The artwork was stunning, and I felt inspired to create something of my own. I spent hours wandering through the galleries, absorbing the creativity and talent on display.")
            }
            .padding(.horizontal, 30)
        }
    }
}

