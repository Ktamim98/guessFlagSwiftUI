//
//  ContentView.swift
//  guessTheFlag
//
//  Created by Tamim Khan on 11/4/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var showingTitle = ""
    
    @State private var score = 0
    @State private var questionNumber = 1
    
  @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAns = Int.random(in: 0...3)
    
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
  


    
    
    var body: some View {
        ZStack{
//            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            
            RadialGradient(stops: [
                .init(color: Color(red:0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red:0.76, green: 0.15, blue: 0.26), location: 0.3),
            ],center: .top, startRadius: 200, endRadius: 400)
            
                .ignoresSafeArea()
            
            
            VStack{
                Spacer()
                
                Text("Guess the Flag")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAns])
                            
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                        }label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                                .rotationEffect(.degrees(showingScore && number == correctAns ? 360 : 0))
                                .rotation3DEffect(.degrees(showingScore && number != correctAns ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                                .accessibilityLabel(labels[countries[number], default: "Unknown Flag"])
                            
                        }
                     
                    }
                   
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                
            }
            .padding()
        }
        .alert(showingTitle, isPresented:$showingScore){
            Button("continue", action: {
                if questionNumber == 8 {
                    restartGame()
                } else {
                    askQuestion()
                }
            })
        }message: {
            Text("your score is \(score)")
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAns{
            showingTitle = "Correct"
            score += 1
            
            
            
            
        }else{
            showingTitle = "Wrong!"
            score -= 1
            
            showingTitle = "Wrong! That's the flag of \(countries[number])."
               
        }
        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAns = Int.random(in: 0...2)
        questionNumber += 1
    }
    func restartGame() {
            score = 0
            questionNumber = 1
            askQuestion()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
