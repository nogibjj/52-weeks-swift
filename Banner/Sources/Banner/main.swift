import SPMUtility

print("Hello, world!")


import ArgumentParser

struct Banner: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Swift command-line tool to manage blog post banners",
        subcommands: [Generate.self])

    init() { }
}

Banner.main()