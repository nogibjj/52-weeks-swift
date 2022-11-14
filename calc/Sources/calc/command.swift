//build a command line tool calculator in Swift
import ArgumentParser

@main
struct Calculator: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A command line calculator written in Swift",
        subcommands: [Add.self]
    )
}

struct Add: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "Add two numbers"
    )

    @Argument(help: "The first number to add")
    var first: Double

    @Argument(help: "The second number to add")
    var second: Double

    func run() throws {
        print(first + second)
    }
}