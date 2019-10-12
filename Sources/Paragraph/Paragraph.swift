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
    return String(format: format, locale: .current, arguments: localization.arguments)
}

// MARK: - Protocols
public protocol AnyLocalization {
    var key: String { get }
}

public protocol CommentedLoclization: AnyLocalization {
    var comment: String { get }
}

public protocol DictLocalization: CommentedLoclization {
    var arguments: [CVarArg] { get }
}

// MARK: - Implementation
public struct CommentedL10n: CommentedLoclization {
    public let key: String
    public let comment: String
}

public struct DictL10n: DictLocalization {
    public let key: String
    public let comment: String
    public let arguments: [CVarArg]
}

extension String: AnyLocalization {
    public var key: String {
        return self
    }
}
