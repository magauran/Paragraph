import Foundation

// MARK: - Operator
prefix operator §

public prefix func §(_ localization: AnyLocalization) -> String {
    return NSLocalizedString(localization.key, comment: "")
}

public prefix func §(_ localization: CommentedLoclization) -> String {
    return NSLocalizedString(localization.key, comment: localization.comment)
}

public prefix func §(_ localization: DictLocalization) -> String {
    let format = NSLocalizedString(localization.key, comment: localization.comment)
    return String(format: format, locale: .current, arguments: localization.arguments.map { $0.intValue })
}

public prefix func §(_ localization: FittingLocalization) -> String {
    let string = NSLocalizedString(localization.key, comment: localization.comment) as NSString
    return string.variantFittingPresentationWidth(localization.width)
}

// MARK: - Protocols
public protocol AnyLocalization {
    var key: String { get }
}

public protocol CommentedLoclization: AnyLocalization {
    var comment: String { get }
}

public protocol DictLocalization: CommentedLoclization {
    var arguments: [ArgumentType] { get }
}

public protocol FittingLocalization: CommentedLoclization {
    var width: Int { get }
}

// MARK: - Implementation
public struct CommentedL10n: CommentedLoclization {
    public let key: String
    public let comment: String
}

public struct DictL10n: DictLocalization {
    public let key: String
    public let comment: String
    public let arguments: [ArgumentType]
}

public struct FittingL10n: FittingLocalization {
    public let key: String
    public let comment: String
    public let width: Int
}

extension String: AnyLocalization {
    public var key: String {
        return self
    }
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
