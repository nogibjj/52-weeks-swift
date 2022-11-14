[![Codespaces Prebuilds](https://github.com/nogibjj/52-weeks-swift/actions/workflows/codespaces/create_codespaces_prebuilds/badge.svg)](https://github.com/nogibjj/52-weeks-swift/actions/workflows/codespaces/create_codespaces_prebuilds)

# 52-weeks-swift
copilot-enabled-swift-live-streaming

## Nov 14th Example 

### calculator

Step 1:
```bash
mkdir calc && cd calc
swift package init --type executable
swift run calc
mv Sources/calc/main.swift Sources/calc/command.swift
```

Step 2:  Add argument parsing into `Package.swift`
Step 3:  Write code in `command.swift`
Step 4:  Run:  `swift run calc add 2 2`


* WORKING!!! (NEED TO RENAME main.swift)

* Another person had the same issue:  https://github.com/apple/swift-argument-parser/issues/393 

### Repeat

mkdir Repeat && cd Repeat
swift package init --type executable
swift run Repeat


### Too much work

mkdir calculator && cd calculator
swift package init --type executable
swift run calculator

## Another try
0. mkdir Count && cd Count
1. swift package init --type executable
2. Add dependency to package

```swift
    dependencies: [
        .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.1.0"),
        ],
```

Current problem....

```bash
/workspaces/52-weeks-swift/Count/Sources/Count/main.swift:1:1: note: top-level code defined in this source file
import ArgumentParser
````


## Next time follow this

* https://github.com/eneko/eneko.github.io/blob/eba32d007dbd7c801816154708839532fbc33377/_posts/2018-01-02-handling-commands-with-swift-package-manager.md

1. Create `mkdir calculator && cd calculator`
2. `swift package init --type executable`
3. `swift run calculator`

Should run `hello worldl`

4.  


## Building a cli for Swift (Failed)

* Use this project/lib:  https://github.com/apple/swift-argument-parser
* Follow this guide:  https://apple.github.io/swift-argument-parser/documentation/argumentparser/gettingstarted

1.  Make a directory for cli project, and initialize project
`mkdir wordcounter && cd wordcounter`
`swift package init --type executable`

You will see the following:
```
Creating executable package: wordcounter
Creating Package.swift
Creating README.md
Creating .gitignore
Creating Sources/
Creating Sources/wordcounter/main.swift
Creating Tests/
Creating Tests/wordcounterTests/
Creating Tests/wordcounterTests/wordcounterTests.swift
```

2. Now create structure according to [guide](Follow this guide:  https://apple.github.io/swift-argument-parser/documentation/argumentparser/gettingstarted)  

Replace `package.swift` with following
```swift
// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Count",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "wordcount",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")]),
    ]
)
```
3.  Build the logic by swapping out the source code with the following

```swift
import ArgumentParser
import Foundation

@main
struct Count: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Word counter.")
    
    @Option(name: [.short, .customLong("input")], help: "A file to read.")
    var inputFile: String

    @Option(name: [.short, .customLong("output")], help: "A file to save word counts to.")
    var outputFile: String

    @Flag(name: .shortAndLong, help: "Print status updates while counting.")
    var verbose = false

    mutating func run() throws {
        if verbose {
            print("""
                Counting words in '\(inputFile)' \
                and writing the result into '\(outputFile)'.
                """)
        }
 
        guard let input = try? String(contentsOfFile: inputFile) else {
            throw RuntimeError("Couldn't read from '\(inputFile)'!")
        }
        
        let words = input.components(separatedBy: .whitespacesAndNewlines)
            .map { word in
                word.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
                    .lowercased()
            }
            .compactMap { word in word.isEmpty ? nil : word }
        
        let counts = Dictionary(grouping: words, by: { $0 })
            .mapValues { $0.count }
            .sorted(by: { $0.value > $1.value })
        
        if verbose {
            print("Found \(counts.count) words.")
        }
        
        let output = counts.map { word, count in "\(word): \(count)" }
            .joined(separator: "\n")
        
        guard let _ = try? output.write(toFile: outputFile, atomically: true, encoding: .utf8) else {
            throw RuntimeError("Couldn't write to '\(outputFile)'!")
        }
    }
}

struct RuntimeError: Error, CustomStringConvertible {
    var description: String
    
    init(_ description: String) {
        self.description = description
    }
}
```

4.  Build it:  `swift build`
5.  Run it:  `swift run`






## Getting started

1. follow steps here:  https://www.swift.org/download/#using-downloads 

```
apt-get install \
          binutils \
          git \
          libc6-dev \
          libcurl4 \
          libedit2 \
          libgcc-5-dev \
          libpython2.7 \
          libsqlite3-0 \
          libstdc++-5-dev \
          libxml2 \
          pkg-config \
          tzdata \
          zlib1g-dev
```

2.  Install swift for Github Codespaces [see this](https://www.swift.org/download/)
