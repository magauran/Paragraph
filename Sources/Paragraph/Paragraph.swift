//
//  Arguments.swift
//
//
//  Created by Alexey Salangin on 10/12/19.
//

import Foundation

// MARK: - Operator
prefix operator §

public prefix func §(_ localization: AnyLocalization) -> String {
    NSLocalizedString(
        localization.key,
        tableName: localization.table,
        bundle: localization.bundle,
        comment: localization.comment
    )
}

public prefix func §(_ localization: DictLocalization) -> String {
    let format = NSLocalizedString(
        localization.key,
        tableName: localization.table,
        bundle: localization.bundle,
        comment: localization.comment
    )
    return String(
        format: format,
        locale: .current,
        arguments: localization.arguments.map { $0.intValue }
    )
}

public prefix func §(_ localization: FittingLocalization) -> String {
    let string = NSLocalizedString(
        localization.key,
        tableName: localization.table,
        bundle: localization.bundle,
        comment: localization.comment
    ) as NSString
    return string.variantFittingPresentationWidth(localization.width)
}

public prefix func §(_ localization: FormatLocalization) -> String {
   let format = NSLocalizedString(
        localization.key,
        tableName: localization.table,
        bundle: localization.bundle,
        comment: localization.comment
    )

    return String(
        format: format,
        locale: .current,
        arguments: localization.arguments
    )
}

// MARK: - Protocols
public protocol AnyLocalization {
    var key: String { get }
    var table: String? { get }
    var bundle: Bundle { get }
    var comment: String { get }
}

public protocol DictLocalization: AnyLocalization {
    var arguments: [ArgumentType] { get }
}

public protocol FittingLocalization: AnyLocalization {
    var width: Int { get }
}

public protocol FormatLocalization: AnyLocalization {
    var arguments: [CVarArg] { get }
}
