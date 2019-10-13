//
//  Arguments.swift
//  
//
//  Created by Alexey Salangin on 10/13/19.
//

public protocol ArgumentType {
    var intValue: Int { get }
}

public enum Gender: Int {
    case male = 0, female, neutral
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
