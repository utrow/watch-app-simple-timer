//
//  HostingController.swift
//  MyWatchTimerWatch Extension
//
//  Created by buch on 2019/10/26.
//  Copyright © 2019 buch. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<ContentView> {
    override var body: ContentView {
        var view = ContentView()
        view.contentViewDelegate = self
        
        return view
    }
}

extension HostingController: ContentViewDelegate {
    func onTapButton() {
        print("onTapButton")
    }
}
