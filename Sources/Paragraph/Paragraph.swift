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
    return String(format: format, locale: .current, arguments: localization.arguments.map { $0.intValue })
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

// MARK: - Implementation
public struct SimpleL10n: AnyLocalization {
    public let key: String
    public let table: String?
    public let bundle: Bundle
    public let comment: String

    public init(key: String, table: String? = nil, bundle: Bundle = .main, comment: String) {
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

    public init(key: String, arguments: [ArgumentType] = [], table: String? = nil, bundle: Bundle = .main, comment: String) {
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

    public init(key: String, width: Int, table: String? = nil, bundle: Bundle = .main, comment: String) {
        self.key = key
        self.table = table
        self.bundle = bundle
        self.comment = comment
        self.width = width
    }
}

extension String: AnyLocalization {
    public var key: String { self }
    public var table: String? { nil }
    public var bundle: Bundle { .main }
    public var comment: String { "" }
}

public enum Gender: Int {
    case male = 0, female, neutral
}

public protocol ArgumentType {
    var intValue: Int { get }
}

extension Int: ArgumentType {
    public var intValue: Int {
        return self
    }
}

extension UInt: ArgumentType {
    public var intValue: Int {
        return Int(truncatingIfNeeded: self)
    }
}

extension Gender: ArgumentType {
    public var intValue: Int {
        return self.rawValue
    }
}
