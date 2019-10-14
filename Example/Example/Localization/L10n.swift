//
//  L10n.swift
//  Example
//
//  Created by Alexey Salangin on 10/12/19.
//  Copyright © 2019 Alexey Salangin. All rights reserved.
//

import Paragraph

enum L10n {
    enum Main {
        static let settingsButton = SimpleL10n(key: "Main.settingsButton", table: "Main", comment: "Title of the settings button")
        static let helloText = "Main.helloText"
        static let device = DictL10n(key: "device", arguments: [], table: "Main", comment: "")
    }

    enum Account {
        static let days: (Int) -> DictL10n = { DictL10n(key: "days", arguments: [$0], table: Self.table, comment: "") }
        static let birthday: (Gender) -> DictL10n = { DictL10n(key: "birthday", arguments: [$0], table: Self.table, comment: "") }
        static let width: (Int) -> FittingL10n = { FittingL10n(key: "width", width: $0, table: Self.table, comment: "") }
        static let call: (Gender, Int) -> DictL10n = { DictL10n(key: "call", arguments: [$0, $1], table: Self.table, comment: "") }

        private static let table = "Account"
    }
}
