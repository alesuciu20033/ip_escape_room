//
//  PageViews.swift
//  CluesToTheCrime
//
//  Created by Denislav Dimitrov on 18.06.24.
//

import SwiftUI
import CoreHaptics

struct RoughTextureView: View {
    var body: some View {
        Image("paper-texture")
            .resizable(capInsets: EdgeInsets(), resizingMode: .tile)
    }
}

struct PageOneView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            
            RoughTextureView()
                .edgesIgnoringSafeArea(.top)
            
            Image("horizontal-line")
                .resizable(resizingMode: .tile)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 10)
                .ignoresSafeArea()
                .opacity(0.2)
            
            VStack {
                HStack {
                    Text("March 15, 2021")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("I had a productive day at work today. Finished a major project that I’ve been working on for weeks. It feels great to see it finally completed. The team celebrated with a small party, and everyone was in high spirits.")
                    .padding()
                    .foregroundColor(.black)
                Text("In the evening, I treated myself to a nice dinner at a new restaurant I've been wanting to try. The food was exquisite, and the ambiance was perfect for unwinding after a long day. I ended the night by watching my favorite show and reflecting on the achievements of the day.")
                    .padding()
                    .foregroundColor(.black)
                HStack {
                    Text("April 2, 2021")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("Went to the farmer's market this morning and bought some fresh fruits and vegetables. I love how vibrant and colorful everything looks. I spent the afternoon cooking a new recipe, and it turned out delicious!")
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}

struct PageTwoView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            RoughTextureView()
                .edgesIgnoringSafeArea(.top)
            VStack(alignment: .leading) {
                HStack {
                    Text("May 10, 2021")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("Met up with some friends I haven’t seen in a while. We had lunch at a new café downtown. It was so good to catch up and hear about what everyone’s been up to. We laughed a lot and made plans to meet again soon.")
                    .foregroundColor(.black)
                    .padding()
                Text("After lunch, we wandered around the city, exploring new shops and taking in the sights. We even stumbled upon a street performance and watched for a while. It was a day filled with joy and connection, and I felt grateful for the friendships that have stood the test of time.")
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}

struct PageThreeView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            RoughTextureView()
                .edgesIgnoringSafeArea(.top)
            VStack {
                HStack {
                    Text("June 8, 2021")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("Spent the day at the beach. The weather was perfect, not too hot and with a gentle breeze. I swam in the ocean, built sandcastles with the kids, and had a picnic by the shore. It was a day well spent. In the afternoon, I took a long walk along the coastline, collecting seashells and enjoying the sound of the waves.")
                    .foregroundColor(.black)
                    .padding()
                Text("As the sun began to set, the sky turned a beautiful array of colors. We ended the day with a bonfire, roasting marshmallows and sharing stories under the stars. It was a perfect summer day.")
                    .foregroundColor(.black)
                    .padding()
                HStack {
                    Text("July 19, 2021")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("Had a quiet day at home today. I did some gardening in the morning, planting new flowers and tidying up the yard. It was so satisfying to see the garden looking vibrant and healthy. I then spent the afternoon painting. It's so relaxing to just lose myself in my hobbies. I created a new piece that I'm really proud of. In the evening, I watched the sunset from my porch, sipping a cup of tea.")
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}

struct PageFourView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            RoughTextureView()
                .edgesIgnoringSafeArea(.top)
            VStack {
                HStack {
                    Text("August 12, 2021")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("Went hiking in the mountains today. The trail was challenging, but the views from the top were worth it. I felt a great sense of accomplishment reaching the peak and enjoyed the peaceful surroundings. The air was crisp and fresh, and the scenery was breathtaking.")
                    .foregroundColor(.black)
                    .padding()
                Text("I took lots of photos to remember the experience. On the way back, I stopped by a small lake and rested for a while, listening to the sounds of nature. It was a refreshing and invigorating day that reminded me of the beauty of the outdoors.")
                    .foregroundColor(.black)
                    .padding()
                HStack {
                    Text("September 30, 2021")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding([.top, .leading])
                    Spacer()
                }
                Text("Visited the local art museum today. They have a new exhibit that I've been wanting to see. The artwork was stunning, and I felt inspired to create something of my own. I spent hours wandering through the galleries, absorbing the creativity and talent on display. Ended the day with a cozy night in, curled up with a good book and a cup of hot chocolate. It was a perfect blend of inspiration and relaxation, and I felt content and at peace.")
                    .foregroundColor(.black)
                    .padding()
            }
        }
    }
}

// The page which contains the note
struct PageFiveNoteView: View {
    @State private var stage = 0
    @StateObject private var hapticFeedbackManager = HapticFeedbackManager()
    
    var body: some View {
        ZStack {
                Color(red: 1.0, green: 0.98, blue: 0.94)
                    .ignoresSafeArea()
            RoughTextureView()
                .edgesIgnoringSafeArea(.top)
            VStack {
                if stage == 0 {
                    VStack(spacing: 50) {
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
        }
    }
}

struct PageSixView: View {
    var body: some View {
        ZStack {
            Color(red: 1.0, green: 0.98, blue: 0.94)
                .ignoresSafeArea()
            Text("Page Six")
                .font(.largeTitle)
                .foregroundStyle(.black)
        }
    }
}
