//
//  ContentView.swift
//  AssignmentApp
//
//  Created by Shreya Wanjari on 02/02/24.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct ContentView: View {
    
      @State var counter: Int = 0
         var countTo: Int = 60
    
    var body: some View {
        VStack {
            Image(systemName: "figure.walk.circle.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 140 , height: 140)
                .foregroundStyle(.pink)
                .padding(.top ,20)
            Text("Routine Starting in...")
                .font(.title)
                .padding(.top ,10)
                .padding(.bottom,80)
          
            VStack{
                
                ZStack{
                            
                            Circle()
                                .fill(Color.clear)
                                .frame(width: 200, height: 200)
                                .overlay(
                                    Circle().stroke(Color.newC , lineWidth: 15)
                            )
                             
                            Circle()
                                .fill(Color.clear)
                                .frame(width: 200, height: 200)
                                .overlay(
                                    Circle().trim(from:0, to: progress())
                                        .stroke(
                                            style: StrokeStyle(
                                                lineWidth: 15,
                                                lineCap: .round,
                                                lineJoin:.round
                                            )
                                        )
                                        .foregroundColor(.pink).animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: 0.2)
                                        )
                                
                             
                            Clock(counter: counter, countTo: countTo)
                        }
         
                    }.onReceive(timer) { time in
                        if (self.counter < self.countTo) {
                            self.counter += 1
                        }
                    }
                }   .padding(.bottom,80)
        
        
        HStack(alignment : .center){
                Button{
                 counter = counter - 10
                    
                }label: {
                    AFBtn(title: "+ 10 sec")
                }
                    
               
                Spacer()
                Button{
                  counter = 0;
                }label: {
                    AFBtn(title: "Skip")
                }
                    
            }   .padding(20)
            Spacer()
        }
    
    

    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}



struct Clock: View {
    var counter : Int
    var countTo : Int
    
    var body : some View {
        VStack {
    Text(counterToMinutes())
        .font(.system(size: 40))
        .fontWeight(.black)
        }
    }
    func counterToMinutes() -> String {
            let currentTime = countTo - counter
            let seconds = currentTime % 60
            let minutes = Int(currentTime / 60)
             
            return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
        }
    }
    
#Preview {
    ContentView()
}
