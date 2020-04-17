<p align="center">
  <img src=".github/logo.png">
</p>

Syntax sugar for localization in iOS.

## Examples
Before use, don't forget to import the framework:
```swift
import Paragraph
```

### Simple string localization
_Localizable.strings_:
```
"It was a bright cold day in April, and the clocks were striking thirteen." = "It was a bright cold day in April, and the clocks were striking thirteen.";
```
Code:
```swift
let quote = §"It was a bright cold day in April, and the clocks were striking thirteen"
// It was a bright cold day in April, and the clocks were striking thirteen.
```

### String localization with parameters
_Localizable.strings_:
```
"1984 quote" = "It was a bright cold day in April, and the clocks were striking thirteen.";
```
Code:
```swift
let quote = §SimpleL10n(key: "1984 quote", comment: "Quote from the book 1984")
// It was a bright cold day in April, and the clocks were striking thirteen.
```
or

_books.strings_:
```
"1984 quote" = "It was a bright cold day in April, and the clocks were striking thirteen.";
```
Code:
```swift
let quote = §SimpleL10n(
    key: "1984 quote",
    table: "books",
    bundle: Bundle.main,
    comment: "Quote from the book 1984"
)
// It was a bright cold day in April, and the clocks were striking thirteen
```

### Dictionary localization
#### Supported arguments types:
- Int
- Uint
- Gender
- [ArgumentType](Sources/Paragraph/Arguments.swift)

#### PluralRule:
_Localizable.stringsdict_:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>years</key>
    <dict>
        <key>NSStringLocalizedFormatKey</key>
        <string>%#@years@</string>
        <key>years</key>
        <dict>
            <key>NSStringFormatSpecTypeKey</key>
            <string>NSStringPluralRuleType</string>
            <key>NSStringFormatValueTypeKey</key>
            <string>d</string>
            <key>zero</key>
            <string>%d years</string>
            <key>one</key>
            <string>%d year</string>
            <key>two</key>
            <string>%d years</string>
            <key>few</key>
            <string>%d years</string>
            <key>many</key>
            <string>%d years</string>
            <key>other</key>
            <string>%d years</string>
        </dict>
    </dict>
</dict>
</plist>
```

Code:
```swift
let years = §DictL10n(key: "years", arguments: [1], comment: "Number of years") // 1 year
```

#### GenderRule:
_Localizable.stringsdict_:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>birthday</key>
    <dict>
        <key>NSStringLocalizedFormatKey</key>
        <string>Wish %#@pronoun@ a happy birthday</string>
        <key>pronoun</key>
        <dict>
            <key>NSStringFormatSpecTypeKey</key>
            <string>NSStringGenderRuleType</string>
            <key>NSStringFormatValueTypeKey</key>
            <string>d</string>
            <key>0</key>
            <string>him</string>
            <key>1</key>
            <string>her</string>
            <key>2</key>
            <string>him</string>
        </dict>
    </dict>
</dict>
</plist>
```
Code:
```swift
let birthday = §DictL10n(
    key: "birthday",
    arguments: [Gender.female],
    comment: "Wish her/him a happy birthday"
) // Wish her a happy birthday
```

### Variable width localization
_Localizable.stringsdict_:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>width</key>
    <dict>
        <key>NSStringVariableWidthRuleType</key>
        <dict>
            <key>100</key>
            <string>Buy</string>
            <key>300</key>
            <string>Buy with Apple Pay</string>
        </dict>
    </dict>
</dict>
</plist>
```

Code:
```swift
let smallButtonText = §FittingL10n(key: "buy", width: 70, comment: "") // Buy
let buttonText = §FittingL10n(key: "buy", width: 250, comment: "") // Buy with Apple Pay
```

### Formatted string localization
_Localizable.strings_:
```
"buyWith" = "Buy with %@ Pay.";
```

```swift
let applePay = §FormatL10n(key: "buyWith", arguments: ["Apple"], comment: "") // Buy with Apple Pay
let googlePay = §FormatL10n(key: "buyWith", arguments: ["Google"], comment: "") // Buy with Google Pay
```

## Installation

### Cocoapods
```ruby
pod 'Paragraph', '~> 0.0.2'
```

### Swift Package Manager
`https://github.com/magauran/Paragraph/`
