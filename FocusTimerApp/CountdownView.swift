//
//  CountdownView.swift
//  FocusTimerApp
//
//  Created by Elias Puolitaival


import SwiftUI
import AVFoundation

struct CountdownView: View {
    let minutes: Int
    @State private var timeRemaining: Int
    @State private var timer: Timer?
    
    @Environment(\.presentationMode) var presentationMode
    
    init(minutes: Int) {
        self.minutes = minutes
        self._timeRemaining = State(initialValue: minutes * 60)
    }
    
    var body: some View {
        ZStack {
            Color.black
            
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
                
                Text("Time Remaining")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .padding()
                
                Text(formatTime(timeRemaining))
                    .foregroundColor(.white)
                    .font(.system(size: 80, weight: .bold, design: .monospaced))
                    .padding()
                
                Spacer()
                
                Button(action: {
                    
                    cancelTimer()
                }) {
                    
                    Text("Cancel")
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
                Spacer()
            }
            .padding()
        }
        .ignoresSafeArea()
        .onAppear {
            startTimer()
        }
        .onDisappear {
            resetTimer()
        }
    }
    
    func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                timer?.invalidate()
                timer = nil
                triggerHapticFeedback()
            }
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func cancelTimer() {
        resetTimer()
        presentationMode.wrappedValue.dismiss()
    }
    
    func triggerHapticFeedback() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    CountdownView(minutes: 15)
}
