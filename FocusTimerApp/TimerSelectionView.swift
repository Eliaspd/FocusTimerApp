//
//  TimerSelectionView.swift
//  FocusTimerApp
//
//  Created by Elias Puolitaival on 2024-11-26.
//


import SwiftUI
import Firebase
import FirebaseAuth

struct TimerSelectionView: View {
    
    @Binding var userIsLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                Spacer()
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(
                        .linearGradient(
                            colors: [.pink, .purple, .blue, .green],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 1000, height: 400)
                    .rotationEffect(.degrees(136))
                    .offset(y: -350)
                    .blur(radius: 70)
                
                VStack(spacing: 20) {
                    Spacer()
                    Text("Let's focus! How long?")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                        .offset(y: -50)
                    
                    
                    ForEach([15, 30, 45, 60], id: \.self) { minutes in
                        NavigationLink(destination: CountdownView(minutes: minutes)) {
                            Text("\(minutes) Minutes")
                                .bold()
                                .frame(width: 250, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.linearGradient(
                                            colors: [.purple, .blue],
                                            startPoint: .top,
                                            endPoint: .bottomTrailing
                                        ))
                                )
                                .foregroundColor(.white)
                        }
                        .padding(.top, 10)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        userIsLoggedIn = false
                        try? Auth.auth().signOut()
                    }) {
                        Text("Log Out")
                            .bold()
                            .frame(width: 250, height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.red)
                            )
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 30)
                }
                .padding()
            }
            .ignoresSafeArea()
        }
    }
}


#Preview {
    TimerSelectionView(userIsLoggedIn: .constant(true))
}
