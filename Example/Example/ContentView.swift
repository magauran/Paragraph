//
//  ContentView.swift
//  Example
//
//  Created by Alexey Salangin on 10/12/19.
//  Copyright © 2019 Alexey Salangin. All rights reserved.
//

import SwiftUI
import Paragraph

struct ContentView: View {
    var body: some View {
        VStack {
            Text(§L10n.Main.helloText)
            Text(§L10n.Account.days(5))
            Text(§L10n.Account.birthday(.female))
            Text(§L10n.Account.width(7))
            Text(§L10n.Main.settingsButton)
            Text(§L10n.Account.call(.male, 10))
            Text(§L10n.Main.device)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
