//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Caleb Wheeler on 1/6/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//  Notes
//  VStack(spacing : 20) {
//  Text("Hello, World!")
//  Text("Za Warduo!")

//  LinearGradient(gradient : Gradient( colors : [.white , .purple]), startPoint : .top , endPoint : .bottom)

//  RadialGradient(gradient : Gradient(colors : [.black, .purple]), center : .center, startRadius: 20 , endRadius : 200 )

//  AngularGradient(gradient: Gradient(colors : [.red, .yellow,.green,.blue, .purple]), center: .center)


import SwiftUI

struct ContentView: View {
    
    @State private var Countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Russia","Spain","UK","US"].shuffled()
    
    @State private var CorrectAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var ScoreTitle = ""
    @State private var Points = 0
    
    
    var body: some View {
        ZStack {
             LinearGradient(gradient: Gradient(colors: [.purple,.black]),startPoint: .top, endPoint:.bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(Countries[CorrectAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                ForEach(0 ..< 3 ) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.Countries[number])
                            .renderingMode(.original)
                        .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black,lineWidth: 1))
                            .shadow(color: .black,radius : 2)
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
        .alert(isPresented: $showingScore) {
            Alert(title: Text(ScoreTitle),message: Text("Your Score is \(Points)"),dismissButton:
                .default(Text("Countinue")) {
                    self.askQuestion()
                })
        }
    }
    func flagTapped(_ number : Int) {
        if number == CorrectAnswer {
            ScoreTitle = "Correct"
            Points += 1
        } else {
            ScoreTitle = "Wrong, The Answer was \(self.Countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        Countries.shuffle()
        CorrectAnswer = Int.random(in: 0...2)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
