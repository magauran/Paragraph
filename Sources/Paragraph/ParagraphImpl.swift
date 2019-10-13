//
//  ParagraphImpl.swift
//  
//
//  Created by Alexey Salangin on 10/13/19.
//

import Foundation

extension String: AnyLocalization {
    public var key: String { self }
    public var table: String? { nil }
    public var bundle: Bundle { .main }
    public var comment: String { "" }
}

public struct SimpleL10n: AnyLocalization {
    public let key: String
    public let table: String?
    public let bundle: Bundle
    public let comment: String

    public init(
        key: String,
        table: String? = nil,
        bundle: Bundle = .main,
        comment: String
    ) {
        self.key = key
        self.table = table
        self.bundle = bundle
        self.comment = comment
    }
}

public struct DictL10n: DictLocalization {
    public let key: String
    public let table: String?
    public let bundle: Bundle
    public let comment: String
    public let arguments: [ArgumentType]

    public init(
        key: String,
        arguments: [ArgumentType] = [],
        table: String? = nil,
        bundle: Bundle = .main,
        comment: String
    ) {
        self.key = key
        self.table = table
        self.bundle = bundle
        self.comment = comment
        self.arguments = arguments
    }
}

public struct FittingL10n: FittingLocalization {
    public let key: String
    public let table: String?
    public let bundle: Bundle
    public let comment: String
    public let width: Int

    public init(
        key: String,
        width: Int,
        table: String? = nil,
        bundle: Bundle = .main,
        comment: String
    ) {
        self.key = key
        self.table = table
        self.bundle = bundle
        self.comment = comment
        self.width = width
    }
}
