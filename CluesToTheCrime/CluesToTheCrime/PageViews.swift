//
//  PageViews.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI
import CoreHaptics

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
    @State private var stage = 0
    @StateObject private var hapticFeedbackManager = HapticFeedbackManager()
    
    var body: some View {
        ZStack {
            DiaryPageBackground()
            
            VStack(spacing: 100) {
                Image("scribble")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Image("scribble")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.8)
            }
            .padding()
            
            VStack {
                if stage == 0 {
                    VStack(spacing: 70) {
                        Text("What is this?")
                            .foregroundStyle(.black)
                            .font(.system(size: 32, design: .serif))
                        
                        Image("folded-note")
                            .resizable()
                            .frame(width: 380, height: 380)
                    }
                    .onAppear {
                        hapticFeedbackManager.playHapticFeedback()
                    }
                    .onTapGesture {
                        withAnimation {
                            stage = 1
                        }
                    }
                } else if stage == 1 {
                    VStack(spacing: 50) {
                        Text("There was a hidden note between the pages!")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.black)
                            .font(.system(size: 32, design: .serif))
                            .padding()
                        Text("Tap to inspect it")
                            .foregroundStyle(.red)
                            .font(.system(size: 28, design: .serif))
                            .padding(.bottom)
                        Image("hidden-note")
                            .resizable()
                            .frame(width: 280, height: 280)
                    }
                    .onTapGesture {
                        withAnimation {
                            stage = 2
                        }
                    }
                } else if stage == 2 {
                    VStack(spacing: 50) {
                        Text("Clue found!")
                            .foregroundStyle(.red)
                            .font(.system(size: 36, design: .serif))
                            .bold()
                            .padding(.bottom)
                        
                        Image("note")
                            .resizable()
                            .frame(width: 300, height: 320)
                        
                        Text("Looks like our victim was afraid of someone already...")
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.gray)
                            .font(.system(size: 20, design: .serif))
                            .padding()
                    }
                }
            }
            .padding()
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

