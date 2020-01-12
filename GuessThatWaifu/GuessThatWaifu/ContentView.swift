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
    
    
    
    @State private var useRed:Bool = false
    @State private var useGreen:Bool = false
    
    var body: some View {

                
        ZStack {
            Image("Testing")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)

            VStack(spacing: 30) {
                            
                VStack {
                    Text("Tap The Waifu")
                        .foregroundColor(useRed ? .red:.white)
                        .font(.largeTitle)
                        
                        
                    Text(Waifus[CorrectGirl])
                        .foregroundColor(useRed ? .red: .white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                                
                }
        
                    
                ForEach(0 ..< 4 ) { number in
                    Button(action: {
                        self.WaifuTapped(number)
                    }) {

                            
                        Image(self.Waifus[number])
                            .renderingMode(.original)
                            .frame(width: 91, height: 91)
                        .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white , lineWidth : 4))
                           
                            

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
                    self.useRed = false
                    self.askQuestion()
                    })
        }
        
    }

    
    func WaifuTapped(_ number : Int) {
        if number == CorrectGirl {
            useRed = false
            ScoreTitle = "Correct"
            Points += 1
        } else {
            ScoreTitle = "Wrong, The Waifu was \(self.Waifus[number])"
            Points = 0
            useRed = true
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
