//
//  ContentView.swift
//  MyWatchTimerWatch Extension
//
//  Created by buch on 2019/10/26.
//  Copyright © 2019 buch. All rights reserved.
//

import SwiftUI

public protocol ContentViewDelegate {
    func onTapButton()
}

struct ContentView: View {
    var contentViewDelegate: ContentViewDelegate?
    var body: some View {
        Button(action: {self.contentViewDelegate?.onTapButton()}) {
            Text("Increment Total")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
