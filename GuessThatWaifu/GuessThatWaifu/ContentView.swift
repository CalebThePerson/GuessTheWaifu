//
//  ContentView.swift
//  GuessThatWaifu
//
//  Created by Caleb Wheeler on 1/8/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State private var Waifus = ["Rem","Chika","Zero Two","SpeedWagon","Ochaco","Momo","Nezuko","Nami","YunYun","Megumin","Darkness","Reigen","Diane","Froppy"].shuffled()
    @State private var CorrectGirl = Int.random(in: 0...2)
    
    @State private var ShowingScore = false
    @State private var ScoreTitle = ""
    @State private var Points = 0
    
    var body: some View {
        ZStack {
            Image("Testing")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                        
                VStack {
                    Spacer()
                    Text("Tap The Waifu")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                    Text(Waifus[CorrectGirl])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                            
                }
    
                
                ForEach(0 ..< 4 ) { number in
                    Button(action: {
                        self.WaifuTapped(number)
                    }) {
                        Image(self.Waifus[number])
                            .renderingMode(.original)
                            .frame(width: 90, height: 90)
                        .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth : 4))
                       
                        

                    }
                    
                }
                Text("You have")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("\(Points) Points")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                        
                Spacer()
            }
        }
        .alert(isPresented: $ShowingScore) {
            Alert(title: Text(ScoreTitle),message: Text("Your Score is \(Points)"),dismissButton:
                .default(Text("Countinue Weeb")) {
                    self.askQuestion()
                })
        }
        
    }
    //.background(Color.black)
    
    func WaifuTapped(_ number : Int) {
        if number == CorrectGirl {
            ScoreTitle = "Correct"
            Points += 1
        } else {
            ScoreTitle = "Wrong, The Waifu was \(self.Waifus[number])"
        }
                
        ShowingScore = true
    }
            
    func askQuestion() {
        Waifus.shuffle()
        CorrectGirl = Int.random(in: 0...2)
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
