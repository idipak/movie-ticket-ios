//
//  DancingText.swift
//  MovieBooking
//
//  Created by Codebucket on 28/09/22.
//

import SwiftUI

struct DancingText: View {
    let letters = Array("Hello, Dipak")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack{
            ForEach(0..<letters.count){ num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? Color.blue : Color.red)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20),
                        value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged{ dragAmount = $0.translation }
                .onEnded{_ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

struct DancingText_Previews: PreviewProvider {
    static var previews: some View {
        DancingText()
    }
}
